import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/study/data/model/algorithms_model.dart';

@injectable
class StudyDataSource {
  Future<AlgorithmsModel> algorithms() async {
    final String response =
    await rootBundle.loadString('assets/json/algorithms.json');
    final data = json.decode(response);
    final model = AlgorithmsModel.fromJson(data);
    return model;
  }


}
