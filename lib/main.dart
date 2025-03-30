import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:operating_systems/core/app/operating_system_app.dart';
import 'package:operating_systems/core/app/role_local_data_source.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OperatingSystemApp.hive();

  configureDependencies();
  runApp(OperatingSystemApp());
}
