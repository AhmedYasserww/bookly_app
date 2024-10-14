import 'dart:developer';

import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/widgets/Already_have_an_account.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/widgets/custom_email_text_field.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/widgets/custom_password_text_field.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/widgets/custom_phone_number_text_field.dart';
import 'package:bookly_app1/Features/Auth/presentaition/views/widgets/cutom_name_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/utils/app_router.dart';
import '../../../home/presentation/views/widgets/custom_button_details.dart';
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool visible = true;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: globalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 75),
                 Text(
                  "Create Account",
                  style: Styles.textStyle30(context),
                ),
                 Text("Fill your information below or register with\n your social media accont ."
                  ,style: Styles.textStyle14(context),
                   textAlign: TextAlign.center,
                 ),
                const SizedBox(height: 30),
                 Align(
                    alignment: Alignment.topLeft,
                    child: Text("UserName",style: Styles.textStyle18(context),)),
                const SizedBox(height: 9,),
                NameField(nameController: nameController),
                const SizedBox(
                  height: 21,
                ),
                 Align(
                    alignment: Alignment.topLeft,
                    child: Text("PhoneNumber",style: Styles.textStyle18(context),)),
                const SizedBox(height: 9,),
                PhoneNumberField(phoneController: phoneNumberController),
                const SizedBox(
                  height: 21,
                ),
                 Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email",style: Styles.textStyle18(context),)),
                const SizedBox(height: 9,),
                EmailField(emailController: emailController),
                const SizedBox(height: 21),
                 Align(
                    alignment: Alignment.topLeft,
                    child: Text("Password",style: Styles.textStyle18(context),)),
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
                const SizedBox(height: 21),
                CustomButtonDetails(
                  globalKey: globalKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  text: "Sign Up",
                  onTap: () async {
                    await _handleRegistration();
                  },
                ),
                AlreadyHaveAnAccount(
                  text: " Do have an account?",
                  textButton:"Sign In" ,
                  onPressed: (){
                    GoRouter.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _handleRegistration() async {
    if (globalKey.currentState!.validate()) {
      try {
        await _registerUser();
      } catch (e) {
        _showSnackBar('Registration failed: ${e.toString()}');
      }
    }
  }

  Future<void> _registerUser() async {
    UserCredential userCredential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    log("User registered");

    User? user = userCredential.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      log("###########################");
      log("Verification email sent");
      _showSnackBar('Verification email sent! Please check your inbox.');
      GoRouter.of(context).pop();
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
