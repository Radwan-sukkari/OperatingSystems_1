import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/quiz/presentation/pages/true_false_chapter_grid.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/section_widget.dart';
import 'package:operating_systems/features/study/presentation/widget/study_section_study_widget.dart';
import 'package:operating_systems/resources/resources.dart';
import 'dart:math' as math;

class StudySectionStudyScreen extends StatelessWidget {
  static const String name = 'study_section_screen';
  static const String path = '/study_section_screen';

  const StudySectionStudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VoidCallback> onTap = [
          () => context.pushNamed(TrueFalseChapterGridScreen.name, queryParameters: {
        "isStudy": "isStudy",
      }),
          () => context.pushNamed(OsiChapterGridScreen.name, queryParameters: {
        "isStudy": "isStudy",
      }),
          () => context.pushNamed(OsiChapterGridScreen.name, queryParameters: {
        "isStudy": "isStudy",
      }),
          () => context.pushNamed(OsiChapterGridScreen.name, queryParameters: {
        "isStudy": "isStudy",
      }),
          () => context.pushNamed(OsiChapterGridScreen.name, queryParameters: {
        "isStudy": "isStudy",
      }),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: SectionWidget(
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
    );
  }
}

List<String> content = [
  "اسئلة الصح والخطا",
  "اسئلة الموقع",
  "التعاريف",
  "الخوارزميات",
  "المقارنات",
];
