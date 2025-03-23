part of 'study_bloc.dart';

class StudyState {
  final BlocStateData<AlgorithmsModel> algorithmState;
  final BlocStateData<ComparisonsModel>comparisonsState;

  const StudyState({
    this.algorithmState = const BlocStateData.init(),
    this.comparisonsState= const BlocStateData.init(),
  });

  copWith({
    BlocStateData<AlgorithmsModel>? algorithmState,
    BlocStateData<ComparisonsModel>? comparisonsState,

  }) =>
      StudyState(
          algorithmState: algorithmState ?? this.algorithmState,
        comparisonsState: comparisonsState??this.comparisonsState
      );
}

