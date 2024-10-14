import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/widgets/Already_have_an_account.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/widgets/custom_email_text_field.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/widgets/custom_password_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/utils/styles.dart';
import '../../../home/presentation/views/widgets/custom_button_details.dart';
class LogInView extends StatefulWidget {
  const LogInView({super.key});
  @override
  State<LogInView> createState() => _LogInViewState();
}
class _LogInViewState extends State<LogInView> {
  bool visible = true;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: globalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 115,),
                Text("Welcome",style: Styles.textStyle20(context).copyWith(fontWeight: FontWeight.w600),),
                Text("Sign In",style: const TextStyle(fontSize: 26).copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height:30,),
                 Align(
                  alignment: Alignment.topLeft,
                    child: Text("Email",style: Styles.textStyle18(context),)),
                const SizedBox(height: 9,),
               EmailField(emailController: emailController),
                const SizedBox(height: 30,),
                 Align(
                  alignment: Alignment.topLeft,
                    child: Text("PassWord",style: Styles.textStyle18(context),)),
                const SizedBox(height: 9,),
                PasswordField(
                  passwordController: passwordController,
                  visible: visible,
                  toggleVisibility: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                 Align(
                  alignment: Alignment.bottomRight,
                    child:  Text("Forget Password ?",style: Styles.textStyle14(context),)),
                const SizedBox(height: 60,),
                CustomButtonDetails(
                  globalKey: globalKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  text: "Sign In",
                  onTap: ()async{
                    await _handleLogin(context);
                  },
                ),

                 AlreadyHaveAnAccount(
                  text: " Don't have an account?",
                  textButton:"Sign Up" ,
                  onPressed: (){
                    GoRouter.of(context).push(AppRouter.kSignUpView);
                  },
                ),
                const SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ) ,
    );
  }
  Future<void> _handleLogin(BuildContext context) async {
    final formState = globalKey.currentState;
    if (formState != null && formState.validate()) {
      try {
        await _signInUser(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
          ),
        );
      }
    }
  }

  Future<void> _signInUser(BuildContext context) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    User? user = userCredential.user;
    if (user != null) {
      if (!user.emailVerified) {
        await _handleEmailNotVerified(user, context);
      } else {
        _showLoginSuccessMessage(context);
        GoRouter.of(context).push(AppRouter.kHomeView);
      }
    }
  }

  Future<void> _handleEmailNotVerified(User user, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Email not verified. Please check your email for verification.'),
        action: SnackBarAction(
          label: 'Resend Verification',
          onPressed: () async {
            await user.sendEmailVerification();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Verification email resent!'),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showLoginSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Log in successful'),
      ),
    );
  }
}
