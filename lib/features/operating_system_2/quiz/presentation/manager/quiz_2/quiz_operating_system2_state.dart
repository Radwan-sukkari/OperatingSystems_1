part of 'quiz_operating_system2_bloc.dart';

class QuizOperatingSystem2State {
  final BlocStateData<QuizModel> osiQuiz2State;
  final BlocStateData<QuizModel> trueFalse2QuizState;
  final BlocStateData<RandomQuizModel> randomQuiz2State;
final BlocStateData<DefinitionsRandomQuizModel>definitionsRandom2QuizState;
  const QuizOperatingSystem2State({
    this.osiQuiz2State = const BlocStateData.init(),
    this.trueFalse2QuizState = const BlocStateData.init(),
    this.randomQuiz2State = const BlocStateData.init(),
    this.definitionsRandom2QuizState=const BlocStateData.init()
  });

  copWith(
          {BlocStateData<QuizModel>? osiQuiz2State,
          BlocStateData<QuizModel>? trueFalse2QuizState,
          BlocStateData<RandomQuizModel>? randomQuiz2State,
             BlocStateData<DefinitionsRandomQuizModel>?definitionsRandom2QuizState

          }) =>
      QuizOperatingSystem2State(
          osiQuiz2State: osiQuiz2State ?? this.osiQuiz2State,
          trueFalse2QuizState: trueFalse2QuizState ?? this.trueFalse2QuizState,
          randomQuiz2State: randomQuiz2State ?? this.randomQuiz2State,
        definitionsRandom2QuizState: definitionsRandom2QuizState??this.definitionsRandom2QuizState
      );
}
