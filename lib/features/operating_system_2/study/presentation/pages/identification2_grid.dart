import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/core/bloc/bloc_state_data_builder.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/manager/quiz_feature/quiz_feature_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/identification_quiz_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/quiz_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/shimmer/osi_chapter_shimmer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/section_widget.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/definitions_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/osi_question_study/osi_question_study_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/manager/quiz_2/quiz_operating_system2_bloc.dart';
import 'package:operating_systems/features/operating_system_2/study/presentation/manager/study2_bloc.dart';

import 'package:operating_systems/resources/resources.dart';

class Identification2GridScreen extends StatelessWidget {
  final String isStudy;
  static const String name = 'identification2_grid_screen';
  static const String path = '/identification2_grid_screen';

  const Identification2GridScreen({super.key, required this.isStudy});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<Study2Bloc>()..add(Definitions2Event()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        body: SafeArea(
          child: SectionWidget(
            widget: BlocSelector<Study2Bloc, Study2State,
                BlocStateData<SystemDefinitionsModel>>(
              selector: (state) => state.definitions2State,
              builder: (context, state) {
                return BlocStateDataBuilder(
                    data: state,
                    onLoading: OsiChapterShimmer(),
                    onSuccess: (state) => Expanded(
                          child: AnimationLimiter(
                            child: GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 2.5,
                              ),
                              itemCount: state!.systemDefinitions.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  columnCount: 2,
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: SecondButton(
                                        name: state.systemDefinitions[index]
                                            .pdfNumberEn,
                                        function: () {
                                          isStudy == "true"
                                              ? context.pushNamed(
                                                  DefinitionsScreen.name,
                                                  extra: state
                                                      .systemDefinitions[index]
                                                      .definitions)
                                              : context.pushNamed(
                                                  IdentificationQuizScreen.name,
                                                  extra: state
                                                      .systemDefinitions[index]
                                                      .definitions);
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ));
              },
            ),
            name: 'اختر الفصل',
            image: Image.asset(
              Images.boy6,
              height: height(210),
            ),
          ),
        ),
      ),
    );
  }
}
