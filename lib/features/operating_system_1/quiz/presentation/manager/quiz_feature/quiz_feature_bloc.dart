import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/definitions_random_quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/domain/use_case/definitions_random_quiz_use_case.dart';
import 'package:operating_systems/features/operating_system_1/quiz/domain/use_case/osi_quiz_use_case.dart';
import 'package:operating_systems/features/operating_system_1/quiz/domain/use_case/random_quiz_use_case.dart';
import 'package:operating_systems/features/operating_system_1/quiz/domain/use_case/true_false_quiz_use_case.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';

part 'quiz_feature_event.dart';

part 'quiz_feature_state.dart';

@injectable
class QuizFeatureBloc extends Bloc<QuizFeatureEvent, QuizFeatureState> {
  final OsiQuizUseCase quizUseCase;
  final TrueFalseQuizUseCase trueFalseQuizUseCase;
  final RandomQuizUseCase randomQuizUseCase;
  final DefinitionsRandomQuizUseCse definitionsRandomQuizUseCse;

  QuizFeatureBloc(this.quizUseCase, this.trueFalseQuizUseCase,
      this.randomQuizUseCase, this.definitionsRandomQuizUseCse)
      : super(QuizFeatureState()) {
    on<OsiQuizEvent>(osiQuizEvent);
    on<TrueFalseQuizEvent>(trueFalseQuizEvent);
    on<RandomQuizEvent>(randomQuizEvent);
    on<DefinitionsRandomQuizEvent>(definitionsRandomQuizEvent);
  }

  Future<void> osiQuizEvent(
      QuizFeatureEvent event, Emitter<QuizFeatureState> emit) async {
    emit(state.copWith(quizState: const BlocStateData.loading()));

    final quiz = await quizUseCase();

    quiz.fold(
      (failure) => emit(state.copWith(quizState: const BlocStateData.failed())),
      (data) => emit(state.copWith(quizState: BlocStateData.success(data))),
    );
  }

  Future<void> trueFalseQuizEvent(
      QuizFeatureEvent event, Emitter<QuizFeatureState> emit) async {
    emit(state.copWith(trueFalseQuizState: const BlocStateData.loading()));

    final trueFalseQuiz = await trueFalseQuizUseCase();

    trueFalseQuiz.fold(
      (failure) =>
          emit(state.copWith(trueFalseQuizState: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(trueFalseQuizState: BlocStateData.success(data))),
    );
  }

  Future<void> randomQuizEvent(
      QuizFeatureEvent event, Emitter<QuizFeatureState> emit) async {
    emit(state.copWith(randomQuizState: const BlocStateData.loading()));

    final randomQuiz = await randomQuizUseCase();

    randomQuiz.fold(
      (failure) =>
          emit(state.copWith(randomQuizState: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(randomQuizState: BlocStateData.success(data))),
    );
  }

  Future<void> definitionsRandomQuizEvent(
      DefinitionsRandomQuizEvent event, Emitter<QuizFeatureState> emit) async {
    emit(state.copWith(
        definitionsRandomQuizState: const BlocStateData.loading()));

    final definitionsRandomQuiz = await definitionsRandomQuizUseCse();

    definitionsRandomQuiz.fold(
      (failure) => emit(state.copWith(
          definitionsRandomQuizState: const BlocStateData.failed())),
      (data) => emit(state.copWith(
          definitionsRandomQuizState: BlocStateData.success(data))),
    );
  }
}
