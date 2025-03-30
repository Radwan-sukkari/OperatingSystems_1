import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/role_local_data_source.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/about_subject_container.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/home_page_row_widget.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/osi2_chapter_grid_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/true_false2_chapter_grid_screen.dart';

class SecondHomePageScreen extends StatelessWidget {
  static const String name = 'second_home_page_screen';
  static const String path = '/choose-second_home_page_screen';

  const SecondHomePageScreen({super.key});

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
                      title1: " قم  باختبار  شامل  لكافة ",
                      title2: '     فصول  osi  ',
                      function: () {},
                    ),
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HomePageRowWidget(
                    isFirstRow: true,
                    questionOsiFunction: () {
                      context.pushNamed(Osi2ChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isStudy",
                          });
                    },
                    quizOsiFunction: () {
                      context.pushNamed(Osi2ChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isNotStudy",
                          });
                    },
                    trueFalseQuestionFunction: () {
                      context.pushNamed(TrueFalse2ChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isStudy",
                          });
                    },
                    trueFalseQuizFunction: () {
                      context.pushNamed(TrueFalse2ChapterGridScreen.name,
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
                      context.pushNamed(Osi2ChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isNotStudy",
                          });
                    },
                    quizOsiFunction: () {
                      context.pushNamed(Osi2ChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isStudy",
                          });
                    },
                    trueFalseQuestionFunction: () {
                      context.pushNamed(TrueFalse2ChapterGridScreen.name,
                          queryParameters: {
                            "isStudy": "isStudy",
                          });
                    },
                    trueFalseQuizFunction: () {
                      context.pushNamed(TrueFalse2ChapterGridScreen.name,
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
