import 'package:firebase_quiz_app/configs/themes/app_dark_theme.dart';
import 'package:firebase_quiz_app/configs/themes/app_light_theme.dart';
import 'package:flutter/widgets.dart';

import 'ui_parameters.dart';

const LinearGradient mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);
const LinearGradient mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

//colors function
LinearGradient mainGradient(BuildContext context) =>
    UiParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;