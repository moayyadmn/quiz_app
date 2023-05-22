import 'package:firebase_quiz_app/configs/themes/custome_text_style.dart';
import 'package:firebase_quiz_app/controllers/question_paper/question_controller_extension.dart';
import 'package:firebase_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:firebase_quiz_app/widgets/common/background_decoration.dart';
import 'package:firebase_quiz_app/widgets/common/custom_app_bar.dart';
import 'package:firebase_quiz_app/widgets/content_area.dart';
import 'package:firebase_quiz_app/widgets/questions/answer_card.dart';
import 'package:firebase_quiz_app/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import 'answer_check_screen.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = '/resultScreen';
  @override
  Widget build(BuildContext context) {
    Color textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: const SizedBox(
          height: 80,
        ),
        title: controller.correctAnsweredQuestion,
      ),
      body: BackgroundDecoration(
        child: BackgroundDecoration(
            child: Column(
          children: [
            Expanded(
                child: ContentArea(
              child: Column(children: [
                Image.asset(
                  'assets/images/congrat.png',
                  width: 150,
                  color: Colors.indigo,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Congratulation ',
                    style: headerText.copyWith(color: textColor),
                  ),
                ),
                Text(
                  'You have got ${controller.points} points',
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Tap below question numbers to view correct answers',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
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
                            mainAxisSpacing: 8),
                        itemBuilder: (_, index) {
                          final question = controller.allQuestions[index];
                          AnswerStatus status = AnswerStatus.notAnswered;
                          final selectedAnswer = question.selectedAnswer;
                          final correctAnswer = question.correctAnswer;
                          if (selectedAnswer == correctAnswer) {
                            status = AnswerStatus.correct;
                          } else if (selectedAnswer == null) {
                            status = AnswerStatus.wrong;
                          } else {
                            status = AnswerStatus.wrong;
                          }
                          return QuestionNumberCard(
                              index: index + 1,
                              status: status,
                              onTap: () {
                                Get.toNamed(AnswerCheckScreen.routeName);
                                controller.jumpToQuestion(index,
                                    isGoBack: false);
                              });
                        }))
              ]),
            )),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                            onPressed: () {
                              controller.tryAgain();
                            },
                            color: Colors.blueGrey,
                            child: const Text(
                              'Try again',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: onSurfaceTextColor),
                            )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: MaterialButton(
                            color: Colors.white70,
                            onPressed: () {
                              controller.saveTestResult();
                            },
                            child: Text(
                              'Go home',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Get.isDarkMode
                                    ? onSurfaceTextColor
                                    : Theme.of(context).primaryColor,
                              ),
                            )),
                      )
                    ],
                  )),
            )
          ],
        )),
      ),
    );
  }
}
