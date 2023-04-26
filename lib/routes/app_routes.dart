import 'package:firebase_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_quiz_app/screens/home/home_screen.dart';
import 'package:firebase_quiz_app/screens/introduction/introduction_screen.dart';
import 'package:get/get.dart';

import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/introduction', page: () => const IntroductionScreen()),
    GetPage(
        name: '/home',
        page: () => const HomeScreen(),
        binding: BindingsBuilder(() {
          Get.put(QuestionPaperController());
        }))
  ];
}
