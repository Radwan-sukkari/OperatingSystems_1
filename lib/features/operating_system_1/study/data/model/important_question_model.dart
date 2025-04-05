// To parse this JSON data, do
//
//     final importantQuestionModel = importantQuestionModelFromJson(jsonString);

import 'dart:convert';

ImportantQuestionModel importantQuestionModelFromJson(String str) => ImportantQuestionModel.fromJson(json.decode(str));

String importantQuestionModelToJson(ImportantQuestionModel data) => json.encode(data.toJson());

class ImportantQuestionModel {
  List<ImportantQuestion> importantQuestion;

  ImportantQuestionModel({
    required this.importantQuestion,
  });

  factory ImportantQuestionModel.fromJson(Map<String, dynamic> json) => ImportantQuestionModel(
    importantQuestion: List<ImportantQuestion>.from(json["importantQuestion"].map((x) => ImportantQuestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "importantQuestion": List<dynamic>.from(importantQuestion.map((x) => x.toJson())),
  };
}

class ImportantQuestion {
  String question;
  String questionEn;
  String answer;
  String image;

  ImportantQuestion({
    required this.question,
    required this.questionEn,
    required this.answer,
    required this.image,
  });

  factory ImportantQuestion.fromJson(Map<String, dynamic> json) => ImportantQuestion(
    question: json["question"],
    questionEn: json["question_en"],
    answer: json["answer"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "question_en": questionEn,
    "answer": answer,
    "image": image,
  };
}
