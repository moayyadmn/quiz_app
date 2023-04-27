import 'package:firebase_quiz_app/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

const Color primaryDarkColorDark = Color(0xff141e30);
const Color primaryColorDark = Color(0xff243b55);
const Color mainTextColorDark = Colors.white70;

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(
            bodyColor: mainTextColorDark, displayColor: mainTextColorDark));
  }
}
