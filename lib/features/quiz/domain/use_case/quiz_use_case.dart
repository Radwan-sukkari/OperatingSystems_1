import 'package:dartz/dartz.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/domain/repositories/quiz_repo.dart';

class QuizUseCase{
  final QuizRepo quizRepo;

  QuizUseCase({required this.quizRepo});
  Future<Either<Failure, QuizModel>> call()=>quizRepo.quiz();

}