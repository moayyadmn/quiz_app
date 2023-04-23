import 'package:firebase_quiz_app/controllers/auth_controller.dart';
import 'package:firebase_quiz_app/controllers/theme_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
