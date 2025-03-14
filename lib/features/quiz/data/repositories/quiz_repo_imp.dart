import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/app/network_repository.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/quiz/data/data_source/quiz_data_source.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/domain/repositories/quiz_repo.dart';

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
}
