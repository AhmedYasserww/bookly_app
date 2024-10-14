import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../generated/assets.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: const Color(0xff282434),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage(Assets.imagesOnnn),
                  fit: BoxFit.fill,
                ),

              ),
            ),
             Text(
              'Learn language easily with books',
              style: Styles.textStyle30(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Read favorite books in their original language with parallel translation',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLogInView);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  const Color(0xff303434),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child:  Text('Get Started',style: Styles.textStyle20(context).copyWith(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
