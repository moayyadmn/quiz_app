import 'package:firebase_quiz_app/configs/themes/app_colors.dart';
import 'package:firebase_quiz_app/configs/themes/custome_text_style.dart';
import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:firebase_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_quiz_app/screens/home/question_card.dart';
import 'package:firebase_quiz_app/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FirebaseSotrageService());
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(mobileScreenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    10.0.spaceX,
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.data_usage_rounded,
                            size: 20,
                          ),
                          10.0.spaceX,
                          Text(
                            "hello friend",
                            style:
                                detailText.copyWith(color: onSurfaceTextColor),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "What do you want to study today?",
                      style: headerText,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ContentArea(
                    addPadding: false,
                    child: Obx(
                      () => ListView.separated(
                          physics: const ClampingScrollPhysics(),
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
