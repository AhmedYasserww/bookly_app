import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:bookly_app1/Core/utils/assets.dart';
import 'package:bookly_app1/Features/Splash/presentation/Views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation <Offset> slidingAnimation;
  @override
  void initState() {
    initSlidingAnimation();
    navigateToHome();

  }

  void navigateToHome() {
     Future.delayed(const Duration(seconds:4),(){
    // Get.to(()=> const HomeView(),transition: Transition.fadeIn,duration: kTransitionDuration);
       GoRouter.of(context).push(AppRouter.kOnBoardingView);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo,),
       SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }
  void initSlidingAnimation() {
    animationController = AnimationController(vsync:this,duration:const Duration(seconds: 2));
    slidingAnimation = Tween<Offset>(begin:const Offset(0,6) , end:const Offset(0,0)).animate(animationController);
    super.initState();
    animationController.forward();
  }
}


