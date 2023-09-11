import 'package:go_router/go_router.dart';
import 'package:qr_scanner/Home/Home_Screen.dart';
import 'package:qr_scanner/PDF/CreatePdf.dart';
 

import '../../Splash/Splash_Screen.dart';

abstract class AppRouter {
  static const KhomeScreen = '/homeScreen';
  static const KcreatePdf = '/createPdf';
   

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
      GoRoute(
        path: KcreatePdf,
        builder: (context, state) => const CreatePDF(),
      ),
      
    ],
  );
}
