import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_quiz_app/firebse_ref/loading_status.dart';
import 'package:firebase_quiz_app/firebse_ref/references.dart';
import 'package:firebase_quiz_app/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  final Rx<LoadingStatus> loadingStatus = LoadingStatus.loading.obs;
  final Rxn<Questions> currentQuestion = Rxn<Questions>();
  @override
  void onReady() {
    final questionPaper = Get.arguments as QuestionPaperModel;
    loadData(questionPaper);
    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel questionPaper) async {
    loadingStatus.value = LoadingStatus.loading;
    questionPaperModel = questionPaper;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();
      final List<Questions> questions = questionQuery.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();
      questionPaper.questions = questions;
      for (Questions question in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> anwersQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(question.id)
                .collection('answers')
                .get();
        final answers = anwersQuery.docs
            .map((answer) => Answers.fromSnapshot(answer))
            .toList();
        question.answers = answers;
        if (questionPaper.questions != null &&
            questionPaper.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaper.questions!);
          currentQuestion.value = questionPaper.questions![0];
          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answers_list']);
  }
}
