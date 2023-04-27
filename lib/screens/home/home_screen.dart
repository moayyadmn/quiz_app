import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:firebase_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_quiz_app/screens/home/question_card.dart';
import 'package:firebase_quiz_app/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FirebaseSotrageService());
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
        body: Obx(
      () => ListView.separated(
          padding: UiParameters.mobileScreenPaddig,
          itemBuilder: (context, index) {
            return QuestionCard(
              model: questionPaperController.allPapers[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: questionPaperController.allPapers.length),
    ));
  }
}
