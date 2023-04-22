import 'package:firebase_quiz_app/screens/introduction/introduction_screen.dart';
import 'package:get/get.dart';

import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/introduction', page: () => const IntroductionScreen()),
  ];
}
