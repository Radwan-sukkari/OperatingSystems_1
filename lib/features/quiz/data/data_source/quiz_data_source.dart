import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';

@injectable
class QuizDataSource {
  Future<QuizModel> osiQuiz() async {
    final String response =
        await rootBundle.loadString('assets/json/scratch.json');
    final data = json.decode(response);
    final model = QuizModel.fromJson(data);
    return model;
  }

  Future<QuizModel> trueFalseQuiz() async {
    final String response =
        await rootBundle.loadString('assets/json/true_false.json');
    final data = json.decode(response);
    final model = QuizModel.fromJson(data);
    return model;
  }
}
