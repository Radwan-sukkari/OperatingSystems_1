import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/study/domain/repositories/study_repo.dart';
@lazySingleton
class AlgorithmsUseCase{
  final StudyRepo studyRepo;

  AlgorithmsUseCase({required this.studyRepo});
  Future<Either<Failure, AlgorithmsModel>> call()=>studyRepo.algorithms();
}