import 'package:firebase_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:firebase_quiz_app/controllers/zoom_drawer_controller.dart';
import 'package:firebase_quiz_app/screens/home/home_screen.dart';
import 'package:firebase_quiz_app/screens/introduction/introduction_screen.dart';
import 'package:get/get.dart';

import '../screens/login/login_screen.dart';
import '../screens/question/questions_screen.dart';
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
          Get.put(MyZoomController());
        })),
    GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
    GetPage(
        name: QuestionsScreen.routeName,
        page: () => const QuestionsScreen(),
        binding: BindingsBuilder(
          () {
            Get.put(QuestionsController());
          },
        ))
  ];
}
