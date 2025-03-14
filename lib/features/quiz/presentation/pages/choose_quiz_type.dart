import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/quiz/presentation/manager/quiz_feature/quiz_feature_bloc.dart';
import 'package:operating_systems/features/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/section_widget.dart';
import 'package:operating_systems/resources/resources.dart';

class ChooseQuizTypeScreen extends StatelessWidget {
  static const String name = 'choose-screen_type_screen';
  static const String path = '/choose-screen_type_screen';

  const ChooseQuizTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: SafeArea(
          child: SectionWidget(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SecondButton(
              name: 'اسئلة الموقع OSI',
              function: () {
                context.pushNamed(OsiChapterGridScreen.name, queryParameters: {
                  "isStudy": "isNotStudy",
                });
              },
            ),
            SizedBox(width: width(30)),
            SecondButton(
              name: 'اسئلة الصح والخطأ',
              function: () {},
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
