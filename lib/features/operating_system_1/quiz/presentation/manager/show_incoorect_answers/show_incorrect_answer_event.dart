part of 'show_incorrect_answer_bloc.dart';

 abstract class ShowIncorrectAnswerEvent {}

class AddIncorrectAnswerEvent extends ShowIncorrectAnswerEvent {
 final Question incorrectQuestion;

  AddIncorrectAnswerEvent({required this.incorrectQuestion});
}

class GetIncorrectAnswerEvent extends ShowIncorrectAnswerEvent {}
