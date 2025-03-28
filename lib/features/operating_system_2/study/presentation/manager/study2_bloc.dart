import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_2/study/domain/use_cases/identification_use_case.dart';

import '../../../../../core/bloc/app_state_bloc.dart';

part 'study2_event.dart';

part 'study2_state.dart';

@injectable
class Study2Bloc extends Bloc<Study2Event, Study2State> {
  final Identification2UseCase identification2useCase;

  Study2Bloc(this.identification2useCase) : super(Study2State()) {
    on<Definitions2Event>(definitions2Event);
  }

  Future<void> definitions2Event(
      Study2Event event, Emitter<Study2State> emit) async {
    emit(state.copWith(definitions2State: const BlocStateData.loading()));

    final definitions = await identification2useCase();

    definitions.fold(
      (failure) =>
          emit(state.copWith(definitions2State: const BlocStateData.failed())),
      (data) =>
          emit(state.copWith(definitions2State: BlocStateData.success(data))),
    );
  }
}
