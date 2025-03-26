import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/app/network_repository.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/study/data/data_source/study_data_source.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_1/study/domain/repositories/study_repo.dart';

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

  @override
  Future<Either<Failure, ComparisonsModel>> comparisons() {
    networkRepository = getIt<NetworkRepository>();
    final algorithms = networkRepository<ComparisonsModel>(
      remoteDataFetcher: () => studyDataSource.comparisons(),
    );
    return algorithms;
  }

  @override
  Future<Either<Failure, SystemDefinitionsModel>> definitions() {
    networkRepository = getIt<NetworkRepository>();
    final definitions = networkRepository<SystemDefinitionsModel>(
      remoteDataFetcher: () => studyDataSource.definitions(),
    );
    return definitions;
  }
}
