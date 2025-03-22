import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';

@injectable
class StudyDataSource {
  Future<AlgorithmsModel> algorithms() async {
    final String response =
    await rootBundle.loadString('assets/json/algorithms.json');
    final data = json.decode(response);
    final model = AlgorithmsModel.fromJson(data);
    return model;
  }
  Future<ComparisonsModel> comparisons() async {
    final String response =
    await rootBundle.loadString('assets/json/comparison.json');
    final data = json.decode(response);
    final model = ComparisonsModel.fromJson(data);
    return model;
  }

}
