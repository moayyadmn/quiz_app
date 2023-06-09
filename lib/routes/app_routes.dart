import 'package:firebase_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:firebase_quiz_app/controllers/zoom_drawer_controller.dart';
import 'package:firebase_quiz_app/screens/question/result_screen.dart';
import '../screens/question/answer_check_screen.dart';
import '/screens/home/home_screen.dart';
import '../screens/introduction/introduction_screen.dart';
import 'package:get/get.dart';
import '../screens/login/login_screen.dart';
import '../screens/question/questions_screen.dart';
import '../screens/question/test_overview_screen.dart';
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
            Get.put<QuestionsController>(QuestionsController());
          },
        )),
    GetPage(
        name: TestOverViewScreen.routeName,
        page: () => const TestOverViewScreen()),
    GetPage(name: ResultScreen.routeName, page: () => const ResultScreen()),
    GetPage(
        name: AnswerCheckScreen.routeName,
        page: () => const AnswerCheckScreen()),
  ];
}
