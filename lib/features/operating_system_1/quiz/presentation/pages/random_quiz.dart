import 'package:flutter/material.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/operating_system_app.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/choose_definition_random_question_number_dialog.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/choose_random_question_number-dialoge.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/widgets/Choose_random_question2_number_dialog.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/widgets/choose_definitions_2_random_question_number_dailog.dart';
import 'package:operating_systems/resources/resources.dart';

class RandomQuiz extends StatelessWidget {
  final String isOperatingSystem1;
  static const String name = 'random_quiz_screen';
  static const String path = '/random_quiz_screen';

  RandomQuiz({super.key, required this.isOperatingSystem1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "اختبار شامل",
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Padding(
          padding: EdgeInsets.only(
            right: width(25),
            left: width(25),
            top: height(40),
            bottom: height(0),
          ),
          child: SingleChildScrollView(
            child: ColumnAnimations(
                duration: 150,
                curve: Curves.easeIn,
                columnContent: [
                  Image.asset(Images.boy12),
                  SizedBox(height: height(30)),
                  Text(
                    "قم باختبار عشوائي لكافة الفصول ",
                    softWrap: true,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: height(10)),
                  Text("قم باختيار نوع الكويز الشامل",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: height(30)),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return isOperatingSystem1 == "1"
                                  ? ChooseRandomQuestionNumberDialog()
                                  : ChooseRandomQuestion2NumberDialog();
                            },
                          );
                        },
                        child: Container(
                          height: height(55),
                          width: width(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: const Center(
                            child: Text(
                              "اسئلة الموقع os",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width(20),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return isOperatingSystem1 == "1"
                                  ? ChooseDefinitionRandomQuestionNumberDialog()
                                  : ChooseDefinitions2RandomQuestionNumberDialog();
                            },
                          );
                        },
                        child: Container(
                          height: height(55),
                          width: width(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: const Center(
                            child: Text(
                              "التعاريف",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Text(
                    "ملاحظة : الاسئلة ستكون مولدة بشكل عشوائي من كافة الفصول",
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .primary,
                        fontWeight: FontWeight.w500),
                  ),
                ],
                verticalOffset: 300,
                horizontalOffset: 00),
          )),
    );
  }
}
