import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String id;
  String title;
  String decription;
  String? imageUrl;
  int timeSeconds;
  List<Questions>? questions;
  int questionCount;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      required this.decription,
      this.imageUrl,
      required this.timeSeconds,
      required this.questionCount,
      this.questions});
//for data coming from our locla fiels
  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        decription = json['Decription'],
        imageUrl = json['image_url'],
        timeSeconds = json['time_seconds'],
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();
  // for data comin form firestore
  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        decription = json['Decription'],
        imageUrl = json['image_url'],
        timeSeconds = json['time_seconds'],
        questionCount = json['questions_count'] as int,
        questions =
            []; //we dont want to show the questions in our home screen that is why its empty

  String timeInMinuit() => "${timeSeconds / 60} mins";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['Decription'] = decription;
    data['time_seconds'] = timeSeconds;
    return data;
  }
}

class Questions {
  String id;
  String quesion;
  List<Answers> answers;
  String? correctAnswer;
  String? selectedAnswer;

  Questions(
      {required this.id,
      required this.quesion,
      required this.answers,
      this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        quesion = json['quesion'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        quesion = snapshot['quesion'],
        answers = [],
        correctAnswer = snapshot['correct_answer'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quesion'] = quesion;
    data['answers'] = answers.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String? identifire;
  String? answer;

  Answers({this.identifire, this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifire = json['identifire'],
        answer = json['Answer'];
  Answers.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : identifire = snapshot['identifire'] as String?,
        answer = snapshot['Answer'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifire'] = identifire;
    data['Answer'] = answer;
    return data;
  }
}
