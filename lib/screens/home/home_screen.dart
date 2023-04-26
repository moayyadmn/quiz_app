import 'package:firebase_quiz_app/controllers/question_paper/question_paper_controller.dart';
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
          itemBuilder: (context, index) {
            return ClipRRect(
              child: SizedBox(
                child: FadeInImage(
                    placeholder:
                        const AssetImage("assets/images/splash_icon.png"),
                    image: NetworkImage(
                        questionPaperController.allPaperImages[index])),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: questionPaperController.allPaperImages.length),
    ));
  }
}
