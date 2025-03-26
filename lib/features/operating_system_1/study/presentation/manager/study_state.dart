part of 'study_bloc.dart';

class StudyState {
  final BlocStateData<AlgorithmsModel> algorithmState;
  final BlocStateData<ComparisonsModel> comparisonsState;
  final BlocStateData<SystemDefinitionsModel> definitionsState;

  const StudyState({
    this.algorithmState = const BlocStateData.init(),
    this.comparisonsState = const BlocStateData.init(),
    this.definitionsState = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<AlgorithmsModel>? algorithmState,
    BlocStateData<ComparisonsModel>? comparisonsState,
    BlocStateData<SystemDefinitionsModel>? definitionsState,
  }) =>
      StudyState(
          algorithmState: algorithmState ?? this.algorithmState,
          comparisonsState: comparisonsState ?? this.comparisonsState,
          definitionsState: definitionsState ?? this.definitionsState);
}
