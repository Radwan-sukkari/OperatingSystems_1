import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/definitions_random_quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/generated/assets.dart';

@injectable
class QuizOperatingSystem2DataSource {
  Future<QuizModel> osi2Quiz() async {
    final String response = await rootBundle.loadString(Assets.jsonOsi2quiz);
    final data = json.decode(response);
    final model = QuizModel.fromJson(data);
    return model;
  }

  Future<QuizModel> trueFalse2Quiz() async {
    final String response = await rootBundle.loadString(Assets.jsonTrueFalse2);
    final data = json.decode(response);
    final model = QuizModel.fromJson(data);
    return model;
  }

  Future<RandomQuizModel> random2Quiz() async {
    final String response =
        await rootBundle.loadString(Assets.jsonRandomQuizOsi2);
    final data = json.decode(response);
    final model = RandomQuizModel.fromJson(data);
    return model;
  }

  Future<DefinitionsRandomQuizModel> definitionsRandom2Quiz() async {
    final String response =
        await rootBundle.loadString(Assets.jsonDefinitions2RandomQuiz);
    final data = json.decode(response);
    final model = DefinitionsRandomQuizModel.fromJson(data);
    return model;
  }
}
