import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';

abstract class ToggleEvent {}

class SelectAnswer extends ToggleEvent {
  final int selectedIndex;
  SelectAnswer(this.selectedIndex);
}

class ShowAnswer extends ToggleEvent {
  final List<Answer> answers;
  ShowAnswer(this.answers);
}

class ResetState extends ToggleEvent {}

abstract class ToggleState {}

class ToggleInitial extends ToggleState {
  final int? selectedIndex;
  ToggleInitial(this.selectedIndex);
}

// In your ToggleBloc, ensure you have a state for AnswerValidated
class AnswerValidated extends ToggleState {
  final int? selectedIndex;
  final bool isCorrect;
  final int correctAnswerIndex;

  AnswerValidated(this.selectedIndex, this.isCorrect, this.correctAnswerIndex);
}

// In your ToggleBloc, handle the ShowAnswer event
class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(ToggleInitial(null)) {
    on<SelectAnswer>((event, emit) {
      emit(ToggleInitial(event.selectedIndex));
    });

    on<ShowAnswer>((event, emit) {
      final currentState = state;
      if (currentState is ToggleInitial) {
        final selectedIndex = currentState.selectedIndex;
        final correctAnswerIndex = event.answers.indexWhere((answer) => answer.isCorrect);

        if (selectedIndex != null) {
          final isCorrect = event.answers[selectedIndex].isCorrect;
          emit(AnswerValidated(selectedIndex, isCorrect, correctAnswerIndex));
        } else {
          emit(AnswerValidated(null, false, correctAnswerIndex));
        }
      }
    });

    on<ResetState>((event, emit) {
      emit(ToggleInitial(null)); // Reset the state
    });
  }
}