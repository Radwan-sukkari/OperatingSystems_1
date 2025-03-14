import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/app/network_repository.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/study/data/data_source/study_data_source.dart';
import 'package:operating_systems/features/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/study/domain/repositories/study_repo.dart';

@LazySingleton(as: StudyRepo)
class StudyRepoImp implements StudyRepo {
  final StudyDataSource studyDataSource;
  late NetworkRepository networkRepository;

  StudyRepoImp({required this.studyDataSource});

  @override
  Future<Either<Failure, AlgorithmsModel>> algorithms() {
    networkRepository = getIt<NetworkRepository>();
    final algorithms = networkRepository<AlgorithmsModel>(
      remoteDataFetcher: () => studyDataSource.algorithms(),
    );
    return algorithms;
  }
}
