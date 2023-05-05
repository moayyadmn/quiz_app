import 'package:flutter/material.dart';

import '../../widgets/common/background_decoration.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});
  static const String routeName = '/questionsscreen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundDecroation(child: Center(child: Text('hello'),),),
    );
  }
}
