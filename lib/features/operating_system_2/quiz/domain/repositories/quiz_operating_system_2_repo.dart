import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/definitions_random_quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
abstract class QuizOperatingSystem2Repo {
  Future<Either<Failure, QuizModel>> osi2Quiz();

  Future<Either<Failure, QuizModel>> trueFalse2Quiz();

  Future<Either<Failure, RandomQuizModel>> random2Quiz();

  Future<Either<Failure, DefinitionsRandomQuizModel>> definitionsRandom2Quiz();

}
