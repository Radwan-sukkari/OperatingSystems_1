// injection.dart
import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.init();
}

// Add this separate registration function
void registerHiveBox(Box<Question> box) {
  getIt.registerFactory<Box<Question>>(() => box);
}

