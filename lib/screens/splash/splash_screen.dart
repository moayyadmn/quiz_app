import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset(
          'assets/images/splash_icon.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
