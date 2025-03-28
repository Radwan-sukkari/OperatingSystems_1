part of 'study2_bloc.dart';

class Study2State {
  final BlocStateData<SystemDefinitionsModel> definitions2State;

  const Study2State({
    this.definitions2State = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<SystemDefinitionsModel>? definitions2State,
  }) =>
      Study2State(
          definitions2State: definitions2State ?? this.definitions2State);
}
