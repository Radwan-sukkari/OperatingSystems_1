import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/true_false_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/section_widget.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/definitions_grid_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/osi2_chapter_grid_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/true_false2_chapter_grid_screen.dart';
import 'package:operating_systems/features/operating_system_2/study/presentation/pages/identification2_grid.dart';

import 'package:operating_systems/resources/resources.dart';

class ChooseQuizTypeScreen extends StatelessWidget {
  final String subjectType;
  static const String name = 'choose-screen_type_screen';
  static const String path = '/choose-screen_type_screen';

  const ChooseQuizTypeScreen({super.key, required this.subjectType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "الكويز",),

      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: SafeArea(
          child: SectionWidget(
        widget: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondButton(
                  name: 'اسئلة الموقع OSI',
                  function: () {
                    subjectType == "1"
                        ? context
                            .pushNamed(OsiChapterGridScreen.name, queryParameters: {
                            "isStudy": "isNotStudy",
                          })
                        : context.pushNamed(Osi2ChapterGridScreen.name,
                            queryParameters: {
                                "isStudy": "isNotStudy",
                              });
                  },
                ),
                SizedBox(width: width(30)),
                SecondButton(
                  name: 'اسئلة الصح والخطأ',
                  function: () {
                    subjectType == "1"
                        ? context.pushNamed(TrueFalseChapterGridScreen.name,
                            queryParameters: {
                                "isStudy": "isNotStudy",
                              })
                        : context.pushNamed(TrueFalse2ChapterGridScreen.name,
                            queryParameters: {
                                "isStudy": "isNotStudy",
                              });
                  },
                ),

              ],
            ),
            SizedBox(height: height(30)),
            Align(
              alignment: Alignment.topRight,
              child: SecondButton(
                name: 'التعاريف',
                function: () {
                  subjectType == "1"
                      ? context.pushNamed(DefinitionsGridScreen.name,
                      queryParameters: {
                        "isStudy": "isNotStudy",
                      })
                      : context.pushNamed(Identification2GridScreen.name,
                      queryParameters: {
                        "isStudy": "isNotStudy",
                      });
                },
              ),
            ),
          ],
        ),
        name: 'اختر نوع الكويز',
        image: Image.asset(
          Images.boy7,
          height: height(210),
        ),
      )),
    );
  }
}
