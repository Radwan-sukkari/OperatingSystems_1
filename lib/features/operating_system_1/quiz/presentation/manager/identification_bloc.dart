import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowAnswerBloc extends Bloc<ShowAnswerEvent, ShowAnswerState> {
  ShowAnswerBloc() : super(ShowAnswerInitial(false)) {
    on<ToggleShowAnswer>((event, emit) {
      emit(ShowAnswerState(!state.isShowAnswer));
    });
  }
}


abstract class ShowAnswerEvent {}
class ToggleShowAnswer extends ShowAnswerEvent {}




class ShowAnswerState {
  final bool isShowAnswer;

  ShowAnswerState(this.isShowAnswer);
}

class ShowAnswerInitial extends ShowAnswerState {
  ShowAnswerInitial(super.isShowAnswer);
}