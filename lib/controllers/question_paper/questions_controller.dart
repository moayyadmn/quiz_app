import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_quiz_app/firebse_ref/loading_status.dart';
import 'package:firebase_quiz_app/firebse_ref/references.dart';
import 'package:firebase_quiz_app/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  final questionIndex = 0.obs;
  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;
  final Rx<LoadingStatus> loadingStatus = LoadingStatus.loading.obs;
  final Rxn<Questions> currentQuestion = Rxn<Questions>();

  //timer
  int remainSeconds = 1;
  final time = "00:00".obs;

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
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    if (questionPaper.questions != null &&
        questionPaper.questions!.isNotEmpty) {
      allQuestions.assignAll(questionPaper.questions!);
      currentQuestion.value = questionPaper.questions![0];
      _startTimer(questionPaper.timeSeconds);
      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answers_list']);
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) return;
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void prevQuestion() {
    if (questionIndex.value <= 0) return;
    questionIndex.value--;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    Timer.periodic(duration, (timer) {
      if (remainSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
    });
  }
}
