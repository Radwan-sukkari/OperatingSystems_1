part of 'study_bloc.dart';

class StudyState {
  final BlocStateData<AlgorithmsModel> algorithmState;

  const StudyState({
    this.algorithmState = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<AlgorithmsModel>? algorithmState,
  }) =>
      StudyState(
          algorithmState: algorithmState ?? this.algorithmState);
}

