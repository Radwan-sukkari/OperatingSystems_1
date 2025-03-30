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
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/quiz_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/shimmer/osi_chapter_shimmer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/section_widget.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/osi_question_study/osi_question_study_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/manager/quiz_2/quiz_operating_system2_bloc.dart';

import 'package:operating_systems/resources/resources.dart';

class Osi2ChapterGridScreen extends StatefulWidget {
  final String isStudy;
  static const String name = 'osi2_chapter_grid_screen';
  static const String path = '/osi2_chapter_grid_screen';

  const Osi2ChapterGridScreen({super.key, required this.isStudy});

  @override
  State<Osi2ChapterGridScreen> createState() => _Osi2ChapterGridScreenState();
}

class _Osi2ChapterGridScreenState extends State<Osi2ChapterGridScreen> {
  @override
  void initState() {
    print("____________________________i am insideOsi2ChapterGridScreen ");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<QuizOperatingSystem2Bloc>()..add(QuizOsi2Event()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        body: SafeArea(
          child: SectionWidget(
            widget: BlocSelector<QuizOperatingSystem2Bloc,
                QuizOperatingSystem2State, BlocStateData<QuizModel>>(
              selector: (state) => state.osiQuiz2State,
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
                                        name: state.chapters[index].titleEn,
                                        function: () {
                                          widget.isStudy == "isNotStudy"
                                              ? context.pushNamed(
                                                  QuizScreen.name,
                                                  queryParameters: {
                                                    'chapterEnglish': state
                                                        .chapters[index]
                                                        .titleEn,
                                                    'chapterArabic': state
                                                        .chapters[index].titleAr
                                                  },
                                                  extra: state.chapters[index]
                                                      .questions)
                                              : context.pushNamed(
                                                  OsiQuestionStudyScreen.name,
                                                  queryParameters: {
                                                    'chapterEnglish': state
                                                        .chapters[index]
                                                        .titleEn,
                                                    'chapterArabic': state
                                                        .chapters[index].titleAr
                                                  },
                                                  extra: state.chapters[index]
                                                      .questions);
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
