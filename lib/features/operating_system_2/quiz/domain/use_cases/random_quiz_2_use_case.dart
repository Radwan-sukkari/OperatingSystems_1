import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/features/operating_system_2/quiz/domain/repositories/quiz_operating_system_2_repo.dart';
@lazySingleton
class RandomQuiz2UseCase {
  final QuizOperatingSystem2Repo quizOperatingSystem2Repo;

  RandomQuiz2UseCase({required this.quizOperatingSystem2Repo});

  Future<Either<Failure, RandomQuizModel>> call() =>
      quizOperatingSystem2Repo.random2Quiz();
}
