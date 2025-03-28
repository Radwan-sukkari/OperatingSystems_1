import 'package:dartz/dartz.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';

abstract class QuizRepo {
  Future<Either<Failure, QuizModel>> osiQuiz();

  Future<Either<Failure, QuizModel>> trueFalseQuiz();

  Future<Either<Failure, RandomQuizModel>> randomQuiz();

}
