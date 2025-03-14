// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/quiz/data/data_source/quiz_data_source.dart' as _i959;
import '../../features/quiz/data/repositories/quiz_repo_imp.dart' as _i161;
import '../../features/quiz/domain/repositories/quiz_repo.dart' as _i1039;
import '../../features/quiz/domain/use_case/osi_quiz_use_case.dart' as _i883;
import '../../features/quiz/domain/use_case/true_false_quiz_use_case.dart'
    as _i1017;
import '../../features/quiz/presentation/manager/quiz_feature/quiz_feature_bloc.dart'
    as _i975;
import '../app/network_repository.dart' as _i81;

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
    gh.factory<_i959.QuizDataSource>(() => _i959.QuizDataSource());
    gh.lazySingleton<_i1039.QuizRepo>(
        () => _i161.QuizRepoImp(quizDataSource: gh<_i959.QuizDataSource>()));
    gh.lazySingleton<_i883.OsiQuizUseCase>(
        () => _i883.OsiQuizUseCase(quizRepo: gh<_i1039.QuizRepo>()));
    gh.lazySingleton<_i1017.TrueFalseQuizUseCase>(
        () => _i1017.TrueFalseQuizUseCase(quizRepo: gh<_i1039.QuizRepo>()));
    gh.factory<_i975.QuizFeatureBloc>(() => _i975.QuizFeatureBloc(
          gh<_i883.OsiQuizUseCase>(),
          gh<_i1017.TrueFalseQuizUseCase>(),
        ));
    return this;
  }
}
