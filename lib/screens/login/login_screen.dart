import "package:firebase_quiz_app/configs/themes/app_colors.dart";
import "package:firebase_quiz_app/controllers/auth_controller.dart";
import "package:flutter/material.dart";
import "package:get/get_state_manager/src/simple/get_view.dart";

import "../../widgets/common/main_button.dart";

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/splash_icon.png",
            width: 200,
            height: 200,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Text(
              'this is a study app you can use as you want, You have the full access to all the materials in this course',
              style: TextStyle(fontSize: 18, color: onSurfaceTextColor),
              textAlign: TextAlign.center,
            ),
          ),
          MainButton(
            onTap: () {
              controller.signInWithGoogle();
               },
          ),
        ]),
      ),
    );
  }
}
