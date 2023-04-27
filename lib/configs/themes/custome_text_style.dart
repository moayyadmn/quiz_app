import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

TextStyle cardTitles(context) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: UiParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyMedium!.color
        : Theme.of(context).primaryColor);
const detailText = TextStyle(fontSize: 12);
