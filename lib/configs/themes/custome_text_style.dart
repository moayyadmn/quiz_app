import 'package:firebase_quiz_app/configs/themes/app_colors.dart';
import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

TextStyle cardTitles(context) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: UiParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).primaryColor);
const questionTS = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
