// To parse this JSON data, do
//
//     final randomQuizModel = randomQuizModelFromJson(jsonString);

import 'dart:convert';

import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';

RandomQuizModel randomQuizModelFromJson(String str) => RandomQuizModel.fromJson(json.decode(str));

String randomQuizModelToJson(RandomQuizModel data) => json.encode(data.toJson());

class RandomQuizModel {
  final List<Question> randomQuiz;

  RandomQuizModel({
    required this.randomQuiz,
  });

  factory RandomQuizModel.fromJson(Map<String, dynamic> json) => RandomQuizModel(
    randomQuiz: List<Question>.from(json["randomQuiz"].map((x) => Question.fromJson(x))),
  );


  Map<String, dynamic> toJson() => {
    "randomQuiz": List<dynamic>.from(randomQuiz.map((x) => x.toJson())),
  };
}



