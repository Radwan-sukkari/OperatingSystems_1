import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_1/study/domain/repositories/study_repo.dart';
@lazySingleton
class DefinitionsUseCase {
  final StudyRepo studyRepo;

  DefinitionsUseCase({required this.studyRepo});

  Future<Either<Failure, SystemDefinitionsModel>> call() =>
      studyRepo.definitions();
}
