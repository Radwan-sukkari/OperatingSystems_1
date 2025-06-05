import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/true_false_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/algorithm/choose_algorithm_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/definitions_grid_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/osi_question_study/choose_comparisons_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/about_subject_button.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/explain_about_subject.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/head_lines_about_sunbject.dart';

class AboutTheSubject extends StatelessWidget {
  static const String name = 'about_the_subject';
  static const String path = '/about_the_subject';

  const AboutTheSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      appBar: AppAppBar(
        title: "عن المادة",
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Align(
          alignment: Alignment.topRight,
          child: SingleChildScrollView(
            child: ColumnAnimations(
                duration: 400,
                curve: Curves.easeIn,
                columnContent: [
                  HeadLinesAboutSubject(title: "اسئلة الموقع os"),
                  SizedBox(
                    height: height(10),
                  ),
                  ExplainAboutSubject(
                    title:
                        "اسئلة الموقع هي عبارة عن 11 شباتر بمجموع 288 سؤال بجي عليهن بين اختياري وصح وخطأ بما لايقل عن 35 علامة. طبعًا هو عبارة عن موقع، بس الموقع حاليا محظور، بس الطلاب قدرو يسحبو هالأسئلة وحتى الدكتور بجيب منن. وهنن عبارة عن معلومات بالمحاضرات، وفي بعض الاسئلة منن مالن موجودين بالمحاضرات بس بجو بالفحص.",
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HeadLinesAboutSubject(title: "السؤال الأول"),
                  SizedBox(
                    height: height(10),
                  ),
                  ExplainAboutSubject(
                      title:
                          "بجي عبارات صح وخطأ مع التصليح في حال كانت العبارة خطأ ، بجي نص العلامة عالتصحيح ونص التاني اذا صح او خطأ ، العبارات بجو هنن نفسن من الموقع بس ع شكل صح وغلط"),
                  SizedBox(
                    height: height(20),
                  ),
                  AboutSubjectButton(
                    title: 'قم بالضفط هنا لدراسة  صح وخطا ',
                    function: () {
                      context.pushNamed(TrueFalseChapterGridScreen.name, queryParameters: {
                        "isStudy": "isStudy",
                      });
                    },
                  ),
                  SizedBox(
                    height: height(5),
                  ),
                  AboutSubjectButton(
                    title: 'قم بالضفط هنا لكويز اسئلة صح وخطا',
                    function: () {
                      context.pushNamed(TrueFalseChapterGridScreen.name, queryParameters: {
                        "isStudy": "isNotStudy",
                      });
                    },
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HeadLinesAboutSubject(title: "السؤال الثاني "),
                  SizedBox(
                    height: height(10),
                  ),
                  ExplainAboutSubject(
                      title: "اسئلة اختياري بجو كلن من اسئلة الموقع"),
                  SizedBox(
                    height: height(20),
                  ),
                  AboutSubjectButton(
                    title: 'قم بالضفط هنا لدراسة اختياريات اسئلة الموقع ',
                    function: () {
                      context.pushNamed(OsiChapterGridScreen.name, queryParameters: {
                        "isStudy": "isStudy",
                      });
                    },
                  ),
                  SizedBox(
                    height: height(5),
                  ),
                  AboutSubjectButton(
                    title: 'قم بالضفط هنا لكويز اسئلة الموقع',
                    function: () {
                      context.pushNamed(OsiChapterGridScreen.name, queryParameters: {
                        "isStudy": "isNotStudy",
                      });
                    },
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Text(
                    "ملاحظة بالنسبة لدورة الحملة مارح تستفادو من اسئلة الموقع لاني مابجي اختياري بجي بدالن تعاريف ف لازم تدرسو تعاريف حصرا",

                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.error,
                          height: 1.5,
                        ),
                    textAlign: TextAlign.justify, // لمحاذاة النص بشكل متناسق
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  AboutSubjectButton(
                    title: 'قم بالضفط هنا لدراسة التعاريف  ',
                    function: () {context.pushNamed(
                        DefinitionsGridScreen.name,queryParameters: {
                      "isStudy":"true"
                    }
                    );},
                  ),
                  SizedBox(
                    height: height(5),
                  ),
                  AboutSubjectButton(
                    title: 'قم بالضفط هنا لكويز  التعاريف',
                    function: () {
                      context.pushNamed(
                          DefinitionsGridScreen.name,queryParameters: {
                        "isStudy":"false"
                      }
                      );
                    },
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HeadLinesAboutSubject(title: "السؤال الثالث خوارزمية"),
                  SizedBox(
                    height: height(10),
                  ),
                  ExplainAboutSubject(
                      title:
                          "السؤال التالت بجي كتابة خوارزمية من خوارزميات الغصل الخامس هنن عبارة عن مجموعة خوازرميات تقريبا 10 نفس العملي بس بالإضافة في كم وحدة الن بجي عليهن تقريبا بين ال 8 و 10 علامات"),
                  SizedBox(
                    height: height(20),
                  ),
                  AboutSubjectButton(
                    title: 'قم بالضفط هنا لدراسة الخوارزميات',
                    function: () {context.pushNamed(
                      ChooseAlgorithmsScreen.name,
                    );},
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HeadLinesAboutSubject(title: "ماتبقى من الاسئلة"),
                  SizedBox(
                    height: height(10),
                  ),
                  ExplainAboutSubject(
                      title:
                          "اما بالنسبة لباقي الاسئلة بجي مقارنات كتير من الفصول الاخيرة وبجي ممكن عدد ورسم"),
                  SizedBox(height: height(20),),
                  AboutSubjectButton(
                    title: 'قم بالضفط هنا لدراسة المقارنات',
                    function: () {
                      context.pushNamed(
                        ChooseComparisonsScreen.name,
                      );
                    },
                  ),
                  SizedBox(height: height(20),),
                ],
                verticalOffset: 0,
                horizontalOffset: 200),
          ),
        ),
      ),
    );
  }
}
