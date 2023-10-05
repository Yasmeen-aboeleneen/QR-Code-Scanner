import 'package:go_router/go_router.dart';
import 'package:qr_scanner/Home/Home_Screen.dart';

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
      GoRoute(
        path: KhomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
