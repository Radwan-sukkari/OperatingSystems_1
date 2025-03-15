import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/features/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/study/domain/use_case/algorithms_use_case.dart';

part 'study_event.dart';

part 'study_state.dart';
@injectable
class StudyBloc extends Bloc<StudyEvent, StudyState> {
  final AlgorithmsUseCase algorithmsUseCase;

  StudyBloc(this.algorithmsUseCase) : super(StudyState()) {
    on<AlgorithmsEvent>(algorithmsEvent);
  }

  Future<void> algorithmsEvent(
      StudyEvent event, Emitter<StudyState> emit) async {
    emit(state.copWith(algorithmState: const BlocStateData.loading()));

    final algorithms = await algorithmsUseCase();

    algorithms.fold(
      (failure) =>
          emit(state.copWith(algorithmState: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(algorithmState: BlocStateData.success(data))),
    );
  }
}
