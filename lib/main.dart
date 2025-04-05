import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/operating_system_app.dart';
import 'package:operating_systems/core/injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OperatingSystemApp.hive();

  configureDependencies();
  runApp(OperatingSystemApp());
}
