import 'package:dartz/dartz.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/study/data/model/algorithms_model.dart';

abstract class StudyRepo {
  Future<Either<Failure, AlgorithmsModel>> algorithms();
}
