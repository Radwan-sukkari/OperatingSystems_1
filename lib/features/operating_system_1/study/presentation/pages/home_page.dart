import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/true_false_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/about_subject_container.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/home_page_row_widget.dart';

import '../../../quiz/presentation/pages/osi_chapter_grid.dart';

class HomePageScreen extends StatelessWidget {
  static const String name = 'home_page_screen';
  static const String path = '/home_page_screen';

  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: height(40),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width(20)),
                    child: AboutSubjectContainer(
                      title1: "خلينا نتعرف شوي عن  ",
                      title2: ' المادة وشلون بتجي الأسئلة',
                      function: () {},
                    ),
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HomePageRowWidget(
                    isFirstRow: true,
                    questionOsiFunction: () {
                      context.pushNamed(OsiChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isStudy",
                          });
                    },
                    quizOsiFunction: () {
                      context.pushNamed(OsiChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isNotStudy",
                          });
                    },
                    trueFalseQuestionFunction: () {
                      context.pushNamed(TrueFalseChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isStudy",
                          });
                    },
                    trueFalseQuizFunction: () {
                      context.pushNamed(TrueFalseChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isNotStudy",
                          });
                    },
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HomePageRowWidget(
                    isFirstRow: false,
                    questionOsiFunction: () {
                      context.pushNamed(OsiChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isStudy",
                          });
                    },
                    quizOsiFunction: () {
                      context.pushNamed(OsiChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isNotStudy",
                          });
                    },
                    trueFalseQuestionFunction: () {
                      context.pushNamed(TrueFalseChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isStudy",
                          });
                    },
                    trueFalseQuizFunction: () {
                      context.pushNamed(TrueFalseChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isNotStudy",
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
