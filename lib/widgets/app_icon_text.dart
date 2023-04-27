import 'package:firebase_quiz_app/screens/home/question_card.dart';
import 'package:flutter/material.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget text;
  const AppIconText({super.key,required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      icon,
      4.0.spaceX,
      text,
    ],);
  }
}
