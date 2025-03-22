import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/domain/repositories/quiz_repo.dart';
@lazySingleton
class TrueFalseQuizUseCase{
  final QuizRepo quizRepo;

  TrueFalseQuizUseCase({required this.quizRepo});
  Future<Either<Failure, QuizModel>> call()=>quizRepo.trueFalseQuiz();

}