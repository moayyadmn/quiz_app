import 'package:firebase_quiz_app/configs/themes/app_dark_theme.dart';
import 'package:firebase_quiz_app/configs/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xff3ac3cb);
const Color wrongAnswerColor = Color(0xfff85187);
const Color notAnswered = Color(0xff2a3c65);

const LinearGradient mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);
const LinearGradient mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

//colors function
LinearGradient mainGradient() =>
    Get.isDarkMode ? mainGradientDark : mainGradientLight;

//
Color customScaffoldColor(BuildContext context) => UiParameters.isDarkMode()
    ? const Color(0xff2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);
Color answerSelectedColor() => UiParameters.isDarkMode()
    ? Theme.of(Get.context!).cardColor
    : Theme.of(Get.context!).primaryColor;
Color answerBorderColor() => UiParameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
