// To parse this JSON data, do
//
//     final definitionsRandomQuizModel = definitionsRandomQuizModelFromJson(jsonString);

import 'dart:convert';

import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';

DefinitionsRandomQuizModel definitionsRandomQuizModelFromJson(String str) => DefinitionsRandomQuizModel.fromJson(json.decode(str));

String definitionsRandomQuizModelToJson(DefinitionsRandomQuizModel data) => json.encode(data.toJson());

class DefinitionsRandomQuizModel {
  List<Definition> randomQuiz;

  DefinitionsRandomQuizModel({
    required this.randomQuiz,
  });

  factory DefinitionsRandomQuizModel.fromJson(Map<String, dynamic> json) => DefinitionsRandomQuizModel(
    randomQuiz: List<Definition>.from(json["randomQuiz"].map((x) => Definition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "randomQuiz": List<dynamic>.from(randomQuiz.map((x) => x.toJson())),
  };
}

