import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/core/bloc/bloc_state_data_builder.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/important_question_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/manager/study_bloc.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/important_question/important_question_card.dart';

class ImportantQuestionScreen extends StatelessWidget {
  static const String name = 'important_question_screen';
  static const String path = '/important_question_screen';

  const ImportantQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      appBar: AppAppBar(
        title: "اسئلة مكررة",
        isBack: true,
      ),
      body: BlocProvider.value(
        value: getIt<StudyBloc>()..add(ImportantQuestionEvent()),
        child: BlocSelector<StudyBloc, StudyState,
            BlocStateData<ImportantQuestionModel>>(
          selector: (state) => state.importantQuestionState,
          builder: (context, state) {
            return BlocStateDataBuilder(
                data: state,
                onSuccess: (state) => ListView.builder(
                    itemCount: state!.importantQuestion.length,
                    itemBuilder: (builder, index) {
                      return ImportantQuestionCard(
                        importantQuestion: state.importantQuestion[index],
                      );
                    }));
          },
        ),
      ),
    );
  }
}
