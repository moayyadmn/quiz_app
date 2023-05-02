import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_quiz_app/controllers/auth_controller.dart';
import 'package:firebase_quiz_app/firebse_ref/references.dart';
import 'package:firebase_quiz_app/models/question_paper_model.dart';
import 'package:firebase_quiz_app/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPaper();
    super.onReady();
  }

  Future<void> getAllPaper() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      var paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        var imgUrl =
            await Get.find<FirebaseSotrageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {}
    } else {
      _authController.showLoginAlertDialog();
    }
  }
}
