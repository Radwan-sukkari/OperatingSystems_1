part of 'show_incorrect_answer_bloc.dart';

class ShowIncorrectAnswerState {
  final List<Question> incorrectQuestions;

  const ShowIncorrectAnswerState({this.incorrectQuestions = const []});

  ShowIncorrectAnswerState copyWith({
    List<Question>? incorrectQuestions,
  }) {
    return ShowIncorrectAnswerState(
      incorrectQuestions: incorrectQuestions ?? this.incorrectQuestions,
    );
  }
}
