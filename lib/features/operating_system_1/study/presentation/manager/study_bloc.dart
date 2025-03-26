import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_1/study/domain/use_case/algorithms_use_case.dart';
import 'package:operating_systems/features/operating_system_1/study/domain/use_case/comparisons_use_case.dart';
import 'package:operating_systems/features/operating_system_1/study/domain/use_case/definitions_use_case.dart';

part 'study_event.dart';

part 'study_state.dart';

@injectable
class StudyBloc extends Bloc<StudyEvent, StudyState> {
  final AlgorithmsUseCase algorithmsUseCase;
  final ComparisonsUseCase comparisonsUseCase;
  final DefinitionsUseCase definitionsUseCase;

  StudyBloc(
      this.algorithmsUseCase, this.comparisonsUseCase, this.definitionsUseCase)
      : super(StudyState()) {
    on<AlgorithmsEvent>(algorithmsEvent);
    on<ComparisonsEvent>(comparisonsEvent);
    on<Definitions1Event>(definitions1Event);
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

  Future<void> comparisonsEvent(
      StudyEvent event, Emitter<StudyState> emit) async {
    emit(state.copWith(comparisonsState: const BlocStateData.loading()));

    final comparisons = await comparisonsUseCase();

    comparisons.fold(
      (failure) =>
          emit(state.copWith(comparisonsState: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(comparisonsState: BlocStateData.success(data))),
    );
  }

  Future<void> definitions1Event(
      StudyEvent event, Emitter<StudyState> emit) async {
    emit(state.copWith(definitionsState: const BlocStateData.loading()));

    final definitions = await definitionsUseCase();

    definitions.fold(
      (failure) =>
          emit(state.copWith(definitionsState: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(definitionsState: BlocStateData.success(data))),
    );
  }
}
