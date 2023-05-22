import 'package:firebase_quiz_app/configs/themes/custome_text_style.dart';
import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:firebase_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:firebase_quiz_app/widgets/common/background_decoration.dart';
import 'package:firebase_quiz_app/widgets/common/custom_app_bar.dart';
import 'package:firebase_quiz_app/widgets/content_area.dart';
import 'package:firebase_quiz_app/widgets/questions/answer_card.dart';
import 'package:firebase_quiz_app/widgets/questions/count_down_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../widgets/questions/question_number_card.dart';

class TestOverViewScreen extends GetView<QuestionsController> {
  const TestOverViewScreen({super.key});
  static const String routeName = '/testOverViewScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              Row(children: [
                CountDownTimer(
                  time: '',
                  color: UiParameters.isDarkMode()
                      ? Theme.of(context).textTheme.bodyMedium!.color
                      : Theme.of(context).primaryColor,
                ),
                Obx(() => Text(
                      "${controller.time} Remaining",
                      style: countDownCounterTS(),
                    ))
              ]),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: controller.allQuestions.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/ 75,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (_, index) {
                      AnswerStatus? answerStatus;
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                          index: index + 1,
                          status: answerStatus,
                          onTap: () => controller.jumpToQuestion(index));
                    }),
              ),
              ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: UiParameters.mobileScreenPadding,
                    child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          controller.completed();
                        },
                        child: Text(
                          'Complete',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode
                                ? onSurfaceTextColor
                                : Theme.of(context).primaryColor,
                          ),
                        )),
                  ))
            ],
          )))
        ],
      )),
    );
  }
}
