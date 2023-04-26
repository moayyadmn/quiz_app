import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'This is a study app, you can use it as you want, if you understand how this works, you would be able to scale it.',
                style: TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 70,
              ),
              IconButton(
                  onPressed: () {
                    Get.toNamed('/home');
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 40,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
