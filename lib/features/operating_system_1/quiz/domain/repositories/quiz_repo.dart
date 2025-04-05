import 'package:dartz/dartz.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/definitions_random_quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';

abstract class QuizRepo {
  Future<Either<Failure, QuizModel>> osiQuiz();
  Future<Either<Failure, QuizModel>> trueFalseQuiz();
  Future<Either<Failure, RandomQuizModel>> randomQuiz();
  Future<Either<Failure,DefinitionsRandomQuizModel>>definitionsRandomQuiz();

}
