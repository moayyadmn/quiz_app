import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_quiz_app/controllers/auth_controller.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MyZoomController extends GetxController {
  Rxn<User?> user = Rxn();
  // this controller is from zoom drawer package
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle!.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}
}
