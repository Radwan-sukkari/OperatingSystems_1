import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/quiz/domain/repositories/quiz_repo.dart';

import '../../../../../core/errors/failuer.dart';
import '../../data/model/definitions_random_quiz_model.dart';
@lazySingleton
class DefinitionsRandomQuizUseCse {
  final QuizRepo quizRepo;

  DefinitionsRandomQuizUseCse({required this.quizRepo});

  Future<Either<Failure, DefinitionsRandomQuizModel>> call() =>
      quizRepo.definitionsRandomQuiz();

}