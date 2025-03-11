import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/domain/use_case/quiz_use_case.dart';

part 'quiz_feature_event.dart';

part 'quiz_feature_state.dart';
@injectable
class QuizFeatureBloc extends Bloc<QuizFeatureEvent, QuizFeatureState> {
  final QuizUseCase quizUseCase;

  QuizFeatureBloc(this.quizUseCase) : super(QuizFeatureState()) {
    on<QuizEvent>(quizEvent);
  }

  Future<void> quizEvent(
      QuizFeatureEvent event, Emitter<QuizFeatureState> emit) async {
    emit(state.copWith(quizState: const BlocStateData.loading()));

    final quiz = await quizUseCase();

    quiz.fold(
      (failure) => emit(state.copWith(quizState: const BlocStateData.failed())),
      (data) => emit(state.copWith(quizState: BlocStateData.success(data))),
    );
  }
}
