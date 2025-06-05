import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
part 'show_incorrect_answer_event.dart';
part 'show_incorrect_answer_state.dart';
@injectable
class ShowIncorrectAnswerBloc extends Bloc<ShowIncorrectAnswerEvent, ShowIncorrectAnswerState> {
  ShowIncorrectAnswerBloc() : super(const ShowIncorrectAnswerState()) {
    on<AddIncorrectAnswerEvent>(_onAddIncorrectAnswer);
    on<GetIncorrectAnswerEvent>(_onGetIncorrectAnswer);
  }

  void _onAddIncorrectAnswer(
      AddIncorrectAnswerEvent event,
      Emitter<ShowIncorrectAnswerState> emit,
      ) {
    print('AddIncorrectAnswerEvent received for question: ${event.incorrectQuestion.description}');

    if (!state.incorrectQuestions.contains(event.incorrectQuestion)) {
      print('Question not in list, adding new question');
      final updatedList = List<Question>.from(state.incorrectQuestions)
        ..add(event.incorrectQuestion);
      emit(state.copyWith(incorrectQuestions: updatedList));
      print('New incorrect questions count: ${updatedList.length}');
    } else {
      print('Question already exists in incorrect questions list');
    }
  }

  void _onGetIncorrectAnswer(
      GetIncorrectAnswerEvent event,
      Emitter<ShowIncorrectAnswerState> emit,
      ) {
    print('GetIncorrectAnswerEvent received');
    print('Current incorrect questions count: ${state.incorrectQuestions.length}');
    emit(state);
  }

}
