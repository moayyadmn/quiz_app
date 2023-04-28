import 'package:firebase_quiz_app/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

const Color primaryLightColorLight = Color(0xff43c6ac);
const Color primaryColorLight = Color(0xff191654);
const Color mainTextColorLight = Colors.black;
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        iconTheme: getIconTheme(),
        cardColor: cardColor,
        textTheme: getTextTheme().apply(
          bodyColor: mainTextColorLight,
          displayColor: mainTextColorLight,
        ));
  }
}
