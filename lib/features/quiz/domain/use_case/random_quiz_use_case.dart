import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/features/quiz/domain/repositories/quiz_repo.dart';
@lazySingleton
class RandomQuizUseCase {
  final QuizRepo quizRepo;

  RandomQuizUseCase({required this.quizRepo});

  Future<Either<Failure, RandomQuizModel>> call() => quizRepo.randomQuiz();
}
