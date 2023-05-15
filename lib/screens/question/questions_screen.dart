import 'package:firebase_quiz_app/configs/themes/custome_text_style.dart';
import 'package:firebase_quiz_app/firebse_ref/loading_status.dart';
import 'package:firebase_quiz_app/screens/home/question_card.dart';
import 'package:firebase_quiz_app/widgets/common/question_screen_holder.dart';
import 'package:firebase_quiz_app/widgets/content_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/question_paper/questions_controller.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/questions/answer_card.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});
  static const String routeName = '/questionsscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecroation(
          child: Obx(() => Column(
                children: [
                  if (controller.loadingStatus.value == LoadingStatus.loading)
                    const Expanded(
                        child: ContentArea(child: QuestionScreenHolder())),
                  if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                      child: ContentArea(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 25),
                          child: Column(children: [
                            Text(
                              controller.currentQuestion.value!.quesion,
                              style: questionTS,
                            ),
                            GetBuilder<QuestionsController>(
                              id: 'answers_list',
                              builder: (controller) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 25),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    return AnswerCard(
                                      answer:
                                          "${answer.identifire} . ${answer.answer}",
                                      onTap: () {
                                        controller
                                            .selectedAnswer(answer.identifire);
                                      },
                                      isSelected: answer.identifire ==
                                          controller.currentQuestion.value!
                                              .selectedAnswer,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return 10.0.spaceY;
                                  },
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length,
                                );
                              },
                            )
                          ]),
                        ),
                      ),
                    ),
                ],
              ))),
    );
  }
}
