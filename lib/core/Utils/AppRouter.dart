import 'package:go_router/go_router.dart';

import '../../Splash/Splash_Screen.dart';

abstract class AppRouter {
  static const KhomeScreen = '/homeScreen';

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
