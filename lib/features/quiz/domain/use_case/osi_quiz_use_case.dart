import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/domain/repositories/quiz_repo.dart';
@lazySingleton
class OsiQuizUseCase{
  final QuizRepo quizRepo;

  OsiQuizUseCase({required this.quizRepo});
  Future<Either<Failure, QuizModel>> call()=>quizRepo.osiQuiz();

}