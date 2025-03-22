import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/app/network_repository.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/data_source/quiz_data_source.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/domain/repositories/quiz_repo.dart';

@LazySingleton(as: QuizRepo)
class QuizRepoImp implements QuizRepo {
  final QuizDataSource quizDataSource;
  late NetworkRepository networkRepository;

  QuizRepoImp({required this.quizDataSource});

  @override
  Future<Either<Failure, QuizModel>> osiQuiz() {
    networkRepository = getIt<NetworkRepository>();
    final homePage = networkRepository<QuizModel>(
      remoteDataFetcher: () => quizDataSource.osiQuiz(),
      localDataFetcher: null,
    );
    return homePage;
  }

  @override
  Future<Either<Failure, QuizModel>> trueFalseQuiz() {
    networkRepository = getIt<NetworkRepository>();
    final trueFalseQuiz = networkRepository<QuizModel>(
      remoteDataFetcher: () => quizDataSource.trueFalseQuiz(),
    );
    return trueFalseQuiz;
  }

  @override
  Future<Either<Failure, RandomQuizModel>> randomQuiz() {
    networkRepository = getIt<NetworkRepository>();
    final randomQuiz = networkRepository<RandomQuizModel>(
      remoteDataFetcher: () => quizDataSource.randomQuiz(),
    );
    return randomQuiz;
  }
}
