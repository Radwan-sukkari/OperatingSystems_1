part of 'quiz_feature_bloc.dart';

class QuizFeatureState {
  final BlocStateData<QuizModel> osiQuizState;
  final BlocStateData<QuizModel> trueFalseQuizState;

  const QuizFeatureState({
    this.osiQuizState = const BlocStateData.init(),
    this.trueFalseQuizState = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<QuizModel>? quizState,
    BlocStateData<QuizModel>? trueFalseQuizState,
  }) =>
      QuizFeatureState(
          osiQuizState: quizState ?? this.osiQuizState,
          trueFalseQuizState: trueFalseQuizState ?? this.trueFalseQuizState);
}
