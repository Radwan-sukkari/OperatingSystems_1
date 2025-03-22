import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/generated/assets.dart';

@injectable
class QuizDataSource {
  Future<QuizModel> osiQuiz() async {
    final String response = await rootBundle.loadString(Assets.jsonScratch);
    final data = json.decode(response);
    final model = QuizModel.fromJson(data);
    return model;
  }

  Future<QuizModel> trueFalseQuiz() async {
    final String response = await rootBundle.loadString(Assets.jsonTrueFalse);
    final data = json.decode(response);
    final model = QuizModel.fromJson(data);
    return model;
  }
  Future<RandomQuizModel> randomQuiz() async {
    final String response = await rootBundle.loadString(Assets.jsonRandomQuiz);
    final data = json.decode(response);
    final model = RandomQuizModel.fromJson(data);
    return model;
  }
}


