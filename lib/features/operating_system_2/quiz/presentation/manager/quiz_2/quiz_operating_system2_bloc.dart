import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/features/operating_system_2/quiz/domain/use_cases/osi_2_quiz_use_case.dart';
import 'package:operating_systems/features/operating_system_2/quiz/domain/use_cases/random_quiz_2_use_case.dart';
import 'package:operating_systems/features/operating_system_2/quiz/domain/use_cases/true_false_2_use_case.dart';

part 'quiz_operating_system2_event.dart';

part 'quiz_operating_system2_state.dart';

@injectable
class QuizOperatingSystem2Bloc
    extends Bloc<QuizOperatingSystem2Event, QuizOperatingSystem2State> {
  final Osi2QuizUseCase osi2quizUseCase;
  final RandomQuiz2UseCase randomQuiz2UseCase;
  final TrueFalse2UseCase trueFalse2UseCase;

  QuizOperatingSystem2Bloc(
      this.osi2quizUseCase, this.randomQuiz2UseCase, this.trueFalse2UseCase)
      : super(QuizOperatingSystem2State()) {
    on<QuizOsi2Event>(quizOsi2Event);
    on<QuizTrueFalse2Event>(quizTrueFalse2Event);
    on<RandomQuiz2Event>(randomQuiz2Event);
  }

  Future<void> quizOsi2Event(QuizOperatingSystem2Event event,
      Emitter<QuizOperatingSystem2State> emit) async {
    emit(state.copWith(osiQuiz2State: const BlocStateData.loading()));

    final quiz = await osi2quizUseCase();

    quiz.fold(
      (failure) =>
          emit(state.copWith(osiQuiz2State: const BlocStateData.failed())),
      (data) => emit(state.copWith(osiQuiz2State: BlocStateData.success(data))),
    );
  }

  Future<void> quizTrueFalse2Event(QuizOperatingSystem2Event event,
      Emitter<QuizOperatingSystem2State> emit) async {
    emit(state.copWith(trueFalse2QuizState: const BlocStateData.loading()));

    final quiz = await trueFalse2UseCase();

    quiz.fold(
      (failure) => emit(
          state.copWith(trueFalse2QuizState: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(trueFalse2QuizState: BlocStateData.success(data))),
    );
  }

  Future<void> randomQuiz2Event(QuizOperatingSystem2Event event,
      Emitter<QuizOperatingSystem2State> emit) async {
    emit(state.copWith(randomQuiz2State: const BlocStateData.loading()));

    final quiz = await randomQuiz2UseCase();

    quiz.fold(
      (failure) =>
          emit(state.copWith(randomQuiz2State: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(randomQuiz2State: BlocStateData.success(data))),
    );
  }
}
