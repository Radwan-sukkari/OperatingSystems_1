
import 'package:dartz/dartz.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';

abstract class QuizRepo{
  Future<Either<Failure, QuizModel>> quiz();


}