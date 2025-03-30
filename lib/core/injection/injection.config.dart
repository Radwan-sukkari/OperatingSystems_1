// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/favourite/data/data_sources/local_favourite.dart'
    as _i976;
import '../../features/favourite/data/repositories/fav_repo_imp.dart' as _i437;
import '../../features/favourite/domain/repositories/favourite_repo.dart'
    as _i555;
import '../../features/favourite/domain/use_cases/add_to_favorite_use_case.dart'
    as _i875;
import '../../features/favourite/domain/use_cases/delete_from_favourite_use_case.dart'
    as _i351;
import '../../features/favourite/domain/use_cases/get_favourite_use_case.dart'
    as _i785;
import '../../features/favourite/presentation/manager/favourite/favourite_bloc.dart'
    as _i464;
import '../../features/operating_system_1/quiz/data/data_source/quiz_data_source.dart'
    as _i125;
import '../../features/operating_system_1/quiz/data/model/quiz_model.dart'
    as _i595;
import '../../features/operating_system_1/quiz/data/repositories/quiz_repo_imp.dart'
    as _i172;
import '../../features/operating_system_1/quiz/domain/repositories/quiz_repo.dart'
    as _i1006;
import '../../features/operating_system_1/quiz/domain/use_case/osi_quiz_use_case.dart'
    as _i453;
import '../../features/operating_system_1/quiz/domain/use_case/random_quiz_use_case.dart'
    as _i862;
import '../../features/operating_system_1/quiz/domain/use_case/true_false_quiz_use_case.dart'
    as _i668;
import '../../features/operating_system_1/quiz/presentation/manager/answer_selected_bloc.dart'
    as _i660;
import '../../features/operating_system_1/quiz/presentation/manager/identification_bloc.dart'
    as _i835;
import '../../features/operating_system_1/quiz/presentation/manager/quiz_feature/quiz_feature_bloc.dart'
    as _i438;
import '../../features/operating_system_1/study/data/data_source/study_data_source.dart'
    as _i1021;
import '../../features/operating_system_1/study/data/repositories/study_repo_imp.dart'
    as _i1023;
import '../../features/operating_system_1/study/domain/repositories/study_repo.dart'
    as _i370;
import '../../features/operating_system_1/study/domain/use_case/algorithms_use_case.dart'
    as _i577;
import '../../features/operating_system_1/study/domain/use_case/comparisons_use_case.dart'
    as _i575;
import '../../features/operating_system_1/study/domain/use_case/definitions_use_case.dart'
    as _i635;
import '../../features/operating_system_1/study/presentation/manager/study_bloc.dart'
    as _i927;
import '../../features/operating_system_2/quiz/data/data_sources/quiz_2_data_source.dart'
    as _i955;
import '../../features/operating_system_2/quiz/data/repositories/quiz_2_repo_imp.dart'
    as _i945;
import '../../features/operating_system_2/quiz/domain/repositories/quiz_operating_system_2_repo.dart'
    as _i963;
import '../../features/operating_system_2/quiz/domain/use_cases/osi_2_quiz_use_case.dart'
    as _i724;
import '../../features/operating_system_2/quiz/domain/use_cases/random_quiz_2_use_case.dart'
    as _i799;
import '../../features/operating_system_2/quiz/domain/use_cases/true_false_2_use_case.dart'
    as _i589;
import '../../features/operating_system_2/quiz/presentation/manager/quiz_2/quiz_operating_system2_bloc.dart'
    as _i193;
import '../../features/operating_system_2/study/data/data_sources/syudy_2_data_source.dart'
    as _i881;
import '../../features/operating_system_2/study/data/repositories/study_2_repo_imp.dart'
    as _i636;
import '../../features/operating_system_2/study/domain/repositories/study_operaaring_system2_repo.dart'
    as _i822;
import '../../features/operating_system_2/study/domain/use_cases/identification_use_case.dart'
    as _i333;
import '../../features/operating_system_2/study/presentation/manager/study2_bloc.dart'
    as _i958;
import '../app/network_repository.dart' as _i81;
import '../app/role_local_data_source.dart' as _i201;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i81.NetworkRepository>(() => _i81.NetworkRepository());
    gh.factory<_i125.QuizDataSource>(() => _i125.QuizDataSource());
    gh.factory<_i660.ToggleBloc>(() => _i660.ToggleBloc());
    gh.factory<_i835.ShowAnswerBloc>(() => _i835.ShowAnswerBloc());
    gh.factory<_i1021.StudyDataSource>(() => _i1021.StudyDataSource());
    gh.factory<_i955.QuizOperatingSystem2DataSource>(
        () => _i955.QuizOperatingSystem2DataSource());
    gh.factory<_i881.Study2DataSource>(() => _i881.Study2DataSource());
    gh.lazySingleton<_i201.UserAuthenticationLocalDataSource>(
        () => _i201.AuthImpLocalDataSource());
    gh.lazySingleton<_i976.FavoriteLocalDataSource>(() =>
        _i976.FavoriteLocalDataSourceImpl(gh<_i979.Box<_i595.Question>>()));
    gh.lazySingleton<_i1006.QuizRepo>(
        () => _i172.QuizRepoImp(quizDataSource: gh<_i125.QuizDataSource>()));
    gh.lazySingleton<_i963.QuizOperatingSystem2Repo>(() =>
        _i945.QuizOperatingSystem2ImpRepo(
            quizOperatingSystem2DataSource:
                gh<_i955.QuizOperatingSystem2DataSource>()));
    gh.lazySingleton<_i724.Osi2QuizUseCase>(() => _i724.Osi2QuizUseCase(
        quizOperatingSystem2Repo: gh<_i963.QuizOperatingSystem2Repo>()));
    gh.lazySingleton<_i799.RandomQuiz2UseCase>(() => _i799.RandomQuiz2UseCase(
        quizOperatingSystem2Repo: gh<_i963.QuizOperatingSystem2Repo>()));
    gh.lazySingleton<_i589.TrueFalse2UseCase>(() => _i589.TrueFalse2UseCase(
        quizOperatingSystem2Repo: gh<_i963.QuizOperatingSystem2Repo>()));
    gh.lazySingleton<_i370.StudyRepo>(() =>
        _i1023.StudyRepoImp(studyDataSource: gh<_i1021.StudyDataSource>()));
    gh.lazySingleton<_i453.OsiQuizUseCase>(
        () => _i453.OsiQuizUseCase(quizRepo: gh<_i1006.QuizRepo>()));
    gh.lazySingleton<_i862.RandomQuizUseCase>(
        () => _i862.RandomQuizUseCase(quizRepo: gh<_i1006.QuizRepo>()));
    gh.lazySingleton<_i668.TrueFalseQuizUseCase>(
        () => _i668.TrueFalseQuizUseCase(quizRepo: gh<_i1006.QuizRepo>()));
    gh.lazySingleton<_i555.FavouriteRepo>(() =>
        _i437.FavoriteRepositoryImpl(gh<_i976.FavoriteLocalDataSource>()));
    gh.lazySingleton<_i822.StudyOperatingSystem2Repo>(() =>
        _i636.Study2RepoImp(study2dataSource: gh<_i881.Study2DataSource>()));
    gh.lazySingleton<_i875.AddToFavouriteUseCae>(() =>
        _i875.AddToFavouriteUseCae(favouriteRepo: gh<_i555.FavouriteRepo>()));
    gh.lazySingleton<_i351.RemoveFromFavouriteUseCase>(() =>
        _i351.RemoveFromFavouriteUseCase(
            favouriteRepo: gh<_i555.FavouriteRepo>()));
    gh.lazySingleton<_i785.GetFavouriteUseCase>(() =>
        _i785.GetFavouriteUseCase(favouriteRepo: gh<_i555.FavouriteRepo>()));
    gh.factory<_i193.QuizOperatingSystem2Bloc>(
        () => _i193.QuizOperatingSystem2Bloc(
              gh<_i724.Osi2QuizUseCase>(),
              gh<_i799.RandomQuiz2UseCase>(),
              gh<_i589.TrueFalse2UseCase>(),
            ));
    gh.lazySingleton<_i577.AlgorithmsUseCase>(
        () => _i577.AlgorithmsUseCase(studyRepo: gh<_i370.StudyRepo>()));
    gh.lazySingleton<_i575.ComparisonsUseCase>(
        () => _i575.ComparisonsUseCase(studyRepo: gh<_i370.StudyRepo>()));
    gh.lazySingleton<_i635.DefinitionsUseCase>(
        () => _i635.DefinitionsUseCase(studyRepo: gh<_i370.StudyRepo>()));
    gh.factory<_i438.QuizFeatureBloc>(() => _i438.QuizFeatureBloc(
          gh<_i453.OsiQuizUseCase>(),
          gh<_i668.TrueFalseQuizUseCase>(),
          gh<_i862.RandomQuizUseCase>(),
        ));
    gh.lazySingleton<_i333.Identification2UseCase>(() =>
        _i333.Identification2UseCase(
            studyOperatingSystem2Repo: gh<_i822.StudyOperatingSystem2Repo>()));
    gh.factory<_i958.Study2Bloc>(
        () => _i958.Study2Bloc(gh<_i333.Identification2UseCase>()));
    gh.factory<_i464.FavouriteBloc>(() => _i464.FavouriteBloc(
          gh<_i875.AddToFavouriteUseCae>(),
          gh<_i351.RemoveFromFavouriteUseCase>(),
          gh<_i785.GetFavouriteUseCase>(),
        ));
    gh.factory<_i927.StudyBloc>(() => _i927.StudyBloc(
          gh<_i577.AlgorithmsUseCase>(),
          gh<_i575.ComparisonsUseCase>(),
          gh<_i635.DefinitionsUseCase>(),
        ));
    return this;
  }
}
