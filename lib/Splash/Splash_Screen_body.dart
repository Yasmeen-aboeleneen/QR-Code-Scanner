import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/Utils/AppRouter.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    NavigateToHomeScreen();
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void NavigateToHomeScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(() => const HomeScreen(),
      //     transition: Transition.zoom, duration: Ktransition);
      GoRouter.of(context).push(AppRouter.KhomeScreen);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'Assets/Images/pic.jpeg',
            fit: BoxFit.contain,
            height: 180,
            width: 180,
          ),
        ],
      ),
    ));
  }
}
