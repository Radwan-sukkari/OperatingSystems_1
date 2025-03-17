import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/study/domain/repositories/study_repo.dart';

@lazySingleton
class ComparisonsUseCase {
  final StudyRepo studyRepo;

  ComparisonsUseCase({required this.studyRepo});

  Future<Either<Failure, ComparisonsModel>> call() => studyRepo.comparisons();
}
