import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/core/bloc/bloc_state_data_builder.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/section_widget.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/manager/study_bloc.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/comparisons/comparisons_screen.dart';

import 'package:operating_systems/resources/resources.dart';

class ChooseComparisonsScreen extends StatelessWidget {
  static const String name = 'choose_comparisons_screen';
  static const String path = '/choose_comparisons_screen.dart';

  const ChooseComparisonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<StudyBloc>()..add(ComparisonsEvent()),
      child: Scaffold(
        appBar: AppAppBar(title: "المقارنات",isBack: true,),
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        body: SafeArea(
          child: SectionWidget(
            widget: BlocSelector<StudyBloc, StudyState,
                BlocStateData<ComparisonsModel>>(
              selector: (state) => state.comparisonsState,
              builder: (context, state) {
                return BlocStateDataBuilder(
                    data: state,
                    onSuccess: (state) => Expanded(
                          child: AnimationLimiter(
                            child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(16),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 6,
                              ),
                              itemCount: state!.chapters.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  columnCount: 2,
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                        child: SecondButton(
                                            name: state.chapters[index].titleAr,
                                            function: () {
                                              context.pushNamed(
                                                ComparisonsScreen.name,
                                                queryParameters: {
                                                  "title":state.chapters[index].titleAr,
                                                },
                                                extra: state.chapters[index].comparisons,
                                              );
                                            })),
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
