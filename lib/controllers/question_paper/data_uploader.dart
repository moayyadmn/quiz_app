import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_quiz_app/firebse_ref/loading_status.dart';
import 'package:firebase_quiz_app/firebse_ref/references.dart';
import 'package:firebase_quiz_app/models/question_paper_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;
  uploadData() async {
    loadingStatus.value = LoadingStatus.loading;
    final firestore = FirebaseFirestore.instance;
    final String manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // in general here keys refres to the path so we need to to tell where the only path we need from our assets
    // we convert is toList() to make it indexable
    // load json file and print path
    final List<String> papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/papers') && path.contains('.json'))
        .toList();
    List<QuestionPaperModel> questionPaperList = <QuestionPaperModel>[];
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPaperList.add(QuestionPaperModel.fromJson(jsonDecode(
          stringPaperContent))); // or we can do json.decode(stringPaperContent)
    }
    WriteBatch batch = firestore.batch();
    for (var paper in questionPaperList) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "Decription": paper.decription,
        "time_seconds": paper.timeSeconds,
        "questions_count":
            paper.questions == null ? 0 : paper.questions!.length,
      });
      for (var question in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: question.id);
        batch.set(questionPath, {
          "quesion": question.quesion,
          "correct_answer": question.correctAnswer,
        });
        for (var answer in question.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifire),
              {"identifire": answer.identifire, "Answer": answer.answer});
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
