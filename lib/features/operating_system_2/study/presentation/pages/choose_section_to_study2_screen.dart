import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/true_false_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/section_widget.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/algorithm/choose_algorithm_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/osi_question_study/choose_comparisons_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/study_section_study_widget.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/osi2_chapter_grid_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/true_false2_chapter_grid_screen.dart';
import 'package:operating_systems/features/operating_system_2/study/presentation/pages/identification2_grid.dart';

import 'package:operating_systems/resources/resources.dart';
import 'dart:math' as math;

class ChooseSectionToStudy2Screen extends StatelessWidget {
  static const String name = 'study_section_screen';
  static const String path = '/study_section_screen';

  const ChooseSectionToStudy2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VoidCallback> onTap = [
      () =>
          context.pushNamed(TrueFalse2ChapterGridScreen.name, queryParameters: {
            "isStudy": "isStudy",
          }),
      () => context.pushNamed(Osi2ChapterGridScreen.name, queryParameters: {
            "isStudy": "isStudy",
          }),
      () => context.pushNamed(Identification2GridScreen.name, queryParameters: {
            "isStudy": "isStudy",
          }),
    ];

    return Scaffold(
      appBar: AppAppBar(
        title: "الدراسة",
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Padding(
        padding:  EdgeInsets.only(top: height(15)),
        child: SectionWidget(
          widget: AnimationLimiter(
            child: Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 0),
                itemCount: content.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: StudySectionStudyWidget(
                          text: content[index],
                          fun: onTap[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          name: "اختر ماتود ان تدرسه من الاقسام",
          image: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.asset(
              Images.boy5,
              height: height(210),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> content = [
  "اسئلة الصح والخطا",
  "اسئلة الموقع",
  "التعاريف",
];
