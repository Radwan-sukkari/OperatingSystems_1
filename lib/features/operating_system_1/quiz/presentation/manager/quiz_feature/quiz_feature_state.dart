part of 'quiz_feature_bloc.dart';

class QuizFeatureState {
  final BlocStateData<QuizModel> osiQuizState;
  final BlocStateData<QuizModel> trueFalseQuizState;
  final BlocStateData<RandomQuizModel> randomQuizState;


  const QuizFeatureState({
    this.osiQuizState = const BlocStateData.init(),
    this.trueFalseQuizState = const BlocStateData.init(),
    this.randomQuizState = const BlocStateData.init(),
  });

  copWith(
          {BlocStateData<QuizModel>? quizState,
          BlocStateData<QuizModel>? trueFalseQuizState,
          BlocStateData<RandomQuizModel>? randomQuizState,

          }) =>
      QuizFeatureState(
          osiQuizState: quizState ?? this.osiQuizState,
          trueFalseQuizState: trueFalseQuizState ?? this.trueFalseQuizState,
          randomQuizState: randomQuizState ?? this.randomQuizState,
      );
}
