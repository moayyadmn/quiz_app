import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:get/get.dart';

import '../../firebse_ref/references.dart';
import '../auth_controller.dart';

extension QuestionControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestion {
    return '$correctQuestionCount out of ${allQuestions.length} are correct';
  }

  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestResult() async {
    var batch = firestore.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) return;
    batch.set(
        userRf
            .doc(user.email)
            .collection('my_recent_tests')
            .doc(questionPaperModel.id),
        {
          "points": points,
          "correct_answer": "$correctQuestionCount/ ${allQuestions.length}",
          "question_id": questionPaperModel.id,
          "time": questionPaperModel.timeSeconds - remainSeconds
        });
    batch.commit();
    navigateToHomePage();
  }
}
