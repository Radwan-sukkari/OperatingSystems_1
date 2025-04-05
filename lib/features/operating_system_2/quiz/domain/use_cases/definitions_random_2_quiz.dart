import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/definitions_random_quiz_model.dart';
import 'package:operating_systems/features/operating_system_2/quiz/domain/repositories/quiz_operating_system_2_repo.dart';
@lazySingleton
class DefinitionsRandom2QuizUseCase {
  final QuizOperatingSystem2Repo quizOperatingSystem2Repo;

  DefinitionsRandom2QuizUseCase({required this.quizOperatingSystem2Repo});

  Future<Either<Failure, DefinitionsRandomQuizModel>> call() =>
      quizOperatingSystem2Repo.definitionsRandom2Quiz();

}