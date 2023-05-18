import 'package:firebase_quiz_app/configs/themes/custome_text_style.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({super.key, this.color, required this.time});
  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.timer, color: color ?? Theme.of(context).primaryColor),
       const SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: countDownCounterTS().copyWith(color: color),
        )
      ],
    );
  }
}
