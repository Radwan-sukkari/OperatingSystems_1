part of 'study_bloc.dart';

class StudyState {
  final BlocStateData<AlgorithmsModel> algorithmState;
  final BlocStateData<ComparisonsModel> comparisonsState;
  final BlocStateData<SystemDefinitionsModel> definitionsState;
  final BlocStateData<ImportantQuestionModel> importantQuestionState;

  const StudyState({
    this.algorithmState = const BlocStateData.init(),
    this.comparisonsState = const BlocStateData.init(),
    this.definitionsState = const BlocStateData.init(),
    this.importantQuestionState=const BlocStateData.init(),
  });

  copWith({
    BlocStateData<AlgorithmsModel>? algorithmState,
    BlocStateData<ComparisonsModel>? comparisonsState,
    BlocStateData<SystemDefinitionsModel>? definitionsState,
     BlocStateData<ImportantQuestionModel> ?importantQuestionState

  }) =>
      StudyState(
          algorithmState: algorithmState ?? this.algorithmState,
          comparisonsState: comparisonsState ?? this.comparisonsState,
          definitionsState: definitionsState ?? this.definitionsState,
        importantQuestionState: importantQuestionState??this.importantQuestionState
      );
}
