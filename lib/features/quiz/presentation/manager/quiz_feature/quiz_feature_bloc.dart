import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/domain/use_case/osi_quiz_use_case.dart';
import 'package:operating_systems/features/quiz/domain/use_case/true_false_quiz_use_case.dart';

part 'quiz_feature_event.dart';

part 'quiz_feature_state.dart';

@injectable
class QuizFeatureBloc extends Bloc<QuizFeatureEvent, QuizFeatureState> {
  final OsiQuizUseCase quizUseCase;
  final TrueFalseQuizUseCase trueFalseQuizUseCase;

  QuizFeatureBloc(this.quizUseCase, this.trueFalseQuizUseCase)
      : super(QuizFeatureState()) {
    on<OsiQuizEvent>(osiQuizEvent);
    on<TrueFalseQuizEvent>(trueFalseQuizEvent);
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
}
