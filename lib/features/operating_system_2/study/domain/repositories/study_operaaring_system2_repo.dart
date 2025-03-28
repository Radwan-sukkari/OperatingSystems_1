import 'package:dartz/dartz.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';

abstract class StudyOperatingSystem2Repo {
  Future<Either<Failure, SystemDefinitionsModel>> definitions2();
}