part of 'quiz_feature_bloc.dart';

class QuizFeatureState {
  final BlocStateData<QuizModel> osiQuizState;
  final BlocStateData<QuizModel> trueFalseQuizState;
  final BlocStateData<RandomQuizModel> randomQuizState;
  final BlocStateData<DefinitionsRandomQuizModel> definitionsRandomQuizState;

  const QuizFeatureState({
    this.osiQuizState = const BlocStateData.init(),
    this.trueFalseQuizState = const BlocStateData.init(),
    this.randomQuizState = const BlocStateData.init(),
    this.definitionsRandomQuizState = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<QuizModel>? quizState,
    BlocStateData<QuizModel>? trueFalseQuizState,
    BlocStateData<RandomQuizModel>? randomQuizState,
    BlocStateData<DefinitionsRandomQuizModel>? definitionsRandomQuizState,
  }) =>
      QuizFeatureState(
          osiQuizState: quizState ?? this.osiQuizState,
          trueFalseQuizState: trueFalseQuizState ?? this.trueFalseQuizState,
          randomQuizState: randomQuizState ?? this.randomQuizState,
          definitionsRandomQuizState:
              definitionsRandomQuizState ?? this.definitionsRandomQuizState);
}
