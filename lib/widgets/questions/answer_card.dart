import 'package:firebase_quiz_app/configs/themes/app_colors.dart';
import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard(
      {super.key,
      required this.answer,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: UiParameters.cardBorderRadiusd,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: UiParameters.cardBorderRadiusd,
            color: isSelected
                ? answerSelectedColor()
                : Theme.of(context).cardColor,
            border: Border.all(
                color:
                    isSelected ? answerSelectedColor() : answerBorderColor())),
        child: Text(
          answer,
          style: TextStyle(color: isSelected ? onSurfaceTextColor : null),
        ),
      ),
    );
  }
}
