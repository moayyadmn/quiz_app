import 'package:firebase_quiz_app/configs/themes/app_colors.dart';
import 'package:firebase_quiz_app/configs/themes/custome_text_style.dart';
import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:firebase_quiz_app/firebse_ref/loading_status.dart';
import 'package:firebase_quiz_app/screens/home/question_card.dart';
import 'package:firebase_quiz_app/screens/question/test_overview_screen.dart';
import 'package:firebase_quiz_app/widgets/common/question_screen_holder.dart';
import 'package:firebase_quiz_app/widgets/content_area.dart';
import 'package:firebase_quiz_app/widgets/questions/count_down_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/question_paper/questions_controller.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/questions/answer_card.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});
  static const String routeName = '/questionsscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          leading: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: onSurfaceTextColor, width: 2))),
            child: Obx(() => CountDownTimer(
                  time: controller.time.value,
                  color: onSurfaceTextColor,
                )),
          ),
          showActionIcon: true,
          titleWidget: Obx(
            () => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
              style: appBarTS,
            ),
          )),
      body: BackgroundDecoration(
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
                              controller.currentQuestion.value!.question,
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
                                          "${answer.identifier} . ${answer.answer}",
                                      onTap: () {
                                        controller
                                            .selectedAnswer(answer.identifier);
                                      },
                                      isSelected: answer.identifier ==
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
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: UiParameters.mobileScreenPadding,
                      child: Row(children: [
                        Visibility(
                          visible: controller.isFirstQuestion,
                          child: SizedBox(
                            height: 55,
                            width: 55,
                            child: MaterialButton(
                              onPressed: () {
                                controller.prevQuestion();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Get.isDarkMode
                                    ? onSurfaceTextColor
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Visibility(
                          visible: controller.loadingStatus.value ==
                              LoadingStatus.completed,
                          child: MaterialButton(
                              onPressed: () {
                                controller.isLastQuestion
                                    ? Get.toNamed(TestOverViewScreen.routeName)
                                    : controller.nextQuestion();
                              },
                              child: Text(
                                controller.isLastQuestion ? 'Complete' : 'Next',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode
                                      ? onSurfaceTextColor
                                      : Theme.of(context).primaryColor,
                                ),
                              )),
                        ))
                      ]),
                    ),
                  ),
                ],
              ))),
    );
  }
}
