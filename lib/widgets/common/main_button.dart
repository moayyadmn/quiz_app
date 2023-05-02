import 'package:firebase_quiz_app/screens/home/question_card.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key,required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: onTap,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: Row(children: [
            14.0.spaceX,
            Image.asset(
              "assets/images/google_logo.png",
              width: 30,
              height: 30,
            ),
            30.0.spaceX,
            const Text(
              'Sign in with google',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ]),
        ),
      ),
    );
  }
}
