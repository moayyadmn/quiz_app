import 'package:firebase_quiz_app/configs/themes/app_dark_theme.dart';
import 'package:firebase_quiz_app/configs/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
const LinearGradient mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);
const LinearGradient mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

//colors function
LinearGradient mainGradient(BuildContext context) =>
    UiParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

//
Color cutomScuffoldColor(BuildContext context) => UiParameters.isDarkMode()
    ? const Color(0xff2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);
