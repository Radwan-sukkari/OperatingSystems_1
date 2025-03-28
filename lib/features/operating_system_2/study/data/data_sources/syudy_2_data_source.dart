import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/generated/assets.dart';
@injectable
class Study2DataSource{

  Future<SystemDefinitionsModel> definitions() async {
    final String response =
    await rootBundle.loadString(Assets.jsonSystem2Identification);
    final data = json.decode(response);
    final model = SystemDefinitionsModel.fromJson(data);
    return model;
  }
}