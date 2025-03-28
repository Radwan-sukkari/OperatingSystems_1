import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_2/study/domain/repositories/study_operaaring_system2_repo.dart';
@lazySingleton
class Identification2UseCase{
  final StudyOperatingSystem2Repo studyOperatingSystem2Repo;

  Identification2UseCase({required this.studyOperatingSystem2Repo});
  Future<Either<Failure, SystemDefinitionsModel>> call()=>studyOperatingSystem2Repo.definitions2();

}