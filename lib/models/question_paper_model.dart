class QuestionPaperModel {
  String id;
  String title;
  String decription;
  int timeSeconds;
  List<Questions>? questions;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      required this.decription,
      required this.timeSeconds,
      this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        decription = json['Decription'],
        timeSeconds = json['time_seconds'],
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifire'] = identifire;
    data['Answer'] = answer;
    return data;
  }
}
