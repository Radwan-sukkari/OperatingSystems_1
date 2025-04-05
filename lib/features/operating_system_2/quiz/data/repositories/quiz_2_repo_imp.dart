import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/app/network_repository.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/definitions_random_quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/features/operating_system_2/quiz/data/data_sources/quiz_2_data_source.dart';
import 'package:operating_systems/features/operating_system_2/quiz/domain/repositories/quiz_operating_system_2_repo.dart';

@LazySingleton(as: QuizOperatingSystem2Repo)
class QuizOperatingSystem2ImpRepo implements QuizOperatingSystem2Repo {
  final QuizOperatingSystem2DataSource quizOperatingSystem2DataSource;
  late NetworkRepository networkRepository;

  QuizOperatingSystem2ImpRepo({required this.quizOperatingSystem2DataSource});

  @override
  Future<Either<Failure, QuizModel>> osi2Quiz() {
    networkRepository = getIt<NetworkRepository>();
    final osiQuiz = networkRepository<QuizModel>(
      remoteDataFetcher: () => quizOperatingSystem2DataSource.osi2Quiz(),
      localDataFetcher: null,
    );
    return osiQuiz;
  }

  @override
  Future<Either<Failure, RandomQuizModel>> random2Quiz() {
    networkRepository = getIt<NetworkRepository>();
    final random2Quiz = networkRepository<RandomQuizModel>(
      remoteDataFetcher: () => quizOperatingSystem2DataSource.random2Quiz(),
    );
    return random2Quiz;
  }

  @override
  Future<Either<Failure, QuizModel>> trueFalse2Quiz() {
    networkRepository = getIt<NetworkRepository>();
    final trueFalse2Quiz = networkRepository<QuizModel>(
      remoteDataFetcher: () => quizOperatingSystem2DataSource.trueFalse2Quiz(),
      localDataFetcher: null,
    );
    return trueFalse2Quiz;
  }

  @override
  Future<Either<Failure, DefinitionsRandomQuizModel>> definitionsRandom2Quiz() {
    networkRepository = getIt<NetworkRepository>();
    final definitionsRandom2Quiz =
        networkRepository<DefinitionsRandomQuizModel>(
      remoteDataFetcher: () =>
          quizOperatingSystem2DataSource.definitionsRandom2Quiz(),
      localDataFetcher: null,
    );
    return definitionsRandom2Quiz;
  }
}
