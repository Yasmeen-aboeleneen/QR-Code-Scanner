import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_widgets/neon_widgets.dart';

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

  void  NavigateToHomeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
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
    return  SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'Assets/Images/s_top.png',
                  height: 150,
                )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const NeonText(
                    text: "WELCOME TO",
                    spreadColor: Color.fromARGB(255, 254, 254, 254),
                    blurRadius: 30,
                    textSize: 35,
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'RobotoSlab-Bold',
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SlidingText(slidingAnimation: slidingAnimation),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'Assets/Images/bottom.png',
                height: 150,
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const NeonText(
              text: "SCAN",
              fontFamily: 'RobotoSlab-Bold',
              spreadColor: Color.fromARGB(255, 220, 185, 196),
              blurRadius: 30,
              textSize: 50,
              textColor: Color.fromARGB(255, 0, 0, 0),
            ),
          );
        });
  }
}
