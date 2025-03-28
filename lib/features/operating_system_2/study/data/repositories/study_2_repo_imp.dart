import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_2/study/data/data_sources/syudy_2_data_source.dart';
import 'package:operating_systems/features/operating_system_2/study/domain/repositories/study_operaaring_system2_repo.dart';
import '../../../../../core/app/network_repository.dart';

@LazySingleton(as: StudyOperatingSystem2Repo)
class Study2RepoImp implements StudyOperatingSystem2Repo{
  final Study2DataSource study2dataSource;
  late NetworkRepository networkRepository;

  Study2RepoImp({required this.study2dataSource});

  @override
  Future<Either<Failure, SystemDefinitionsModel>> definitions2() {
    networkRepository = getIt<NetworkRepository>();
    final definitions = networkRepository<SystemDefinitionsModel>(
      remoteDataFetcher: () => study2dataSource.definitions(),
    );
    return definitions;
  }

}