import 'package:firebase_quiz_app/configs/themes/app_colors.dart';
import 'package:firebase_quiz_app/configs/themes/custome_text_style.dart';
import 'package:firebase_quiz_app/configs/themes/ui_parameters.dart';
import 'package:firebase_quiz_app/controllers/question_paper/question_paper_controller.dart';
import 'package:firebase_quiz_app/controllers/zoom_drawer_controller.dart';
import 'package:firebase_quiz_app/screens/home/question_card.dart';
import 'package:firebase_quiz_app/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../widgets/content_area.dart';
import 'menu_screen.dart';

class HomeScreen extends GetView<MyZoomController> {
  const HomeScreen({super.key});
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    Get.put(FirebaseSotrageService());
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
        body: GetBuilder<MyZoomController>(
      builder: (_) => ZoomDrawer(
        borderRadius: 50.0,
        menuScreenWidth: double.infinity,
        style: DrawerStyle.defaultStyle,
        angle: 0.0,
        controller: _.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: mainGradient()),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(mobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: controller.toogleDrawer,
                        icon: const Icon(
                          Icons.menu,
                          size: 30,
                        ),
                      ),
                      10.0.spaceX,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.data_usage_rounded,
                              size: 20,
                            ),
                            10.0.spaceX,
                            Text(
                              "hello friend",
                              style: detailText.copyWith(
                                  color: onSurfaceTextColor),
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
                            itemCount:
                                questionPaperController.allPapers.length),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
