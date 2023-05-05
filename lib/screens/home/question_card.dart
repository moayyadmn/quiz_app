import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:firebase_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_quiz_app/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/custome_text_style.dart';
import '../../widgets/app_icon_text.dart';

extension SpaceXY on double {
  SizedBox get spaceX => SizedBox(
        width: this,
      );
  SizedBox get spaceY => SizedBox(
        height: this,
      );
}

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({super.key, required this.model});
  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: UiParameters.carcardBorderRadiusd,
          color: Theme.of(context).cardColor),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(paper: model,tryAgain: false);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: SizedBox(
                    height: Get.width * 0.15,
                    width: Get.width * 0.15,
                    child: CachedNetworkImage(
                      imageUrl: model.imageUrl!,
                      placeholder: (context, url) {
                        return Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/splash_icon.png"),
                    )),
              ),
              12.0.spaceX,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: cardTitles(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Text(model.decription),
                    ),
                    Row(
                      children: [
                        AppIconText(
                          icon: Icon(Icons.help_outline_sharp,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).primaryColor),
                          text: Text(
                            "${model.questionCount} questions",
                            style: detailText.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                          ),
                        ),
                        15.0.spaceX,
                        AppIconText(
                          icon: Icon(Icons.timer,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).primaryColor),
                          text: Text(
                            model.timeInMinit(),
                            style: detailText.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
