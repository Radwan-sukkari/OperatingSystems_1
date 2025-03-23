import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/container_row_card.dart';
import 'package:operating_systems/resources/resources.dart';

class HomePageRowWidget extends StatelessWidget {
  final bool isFirstRow;
  final VoidCallback questionOsiFunction;
  final VoidCallback quizOsiFunction;
  final VoidCallback trueFalseQuestionFunction;
  final VoidCallback trueFalseQuizFunction;

  const HomePageRowWidget(
      {super.key,
      required this.isFirstRow,
      required this.questionOsiFunction,
      required this.quizOsiFunction,
      required this.trueFalseQuestionFunction,
      required this.trueFalseQuizFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFirstRow == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isFirstRow == true
            ? ContainerRowCard(
                firstText: 'الموقع osi',
                secondText: 'اسئلة ',
                thirdText: 'كويز  ',
                firstOnTap: questionOsiFunction,
                secondOnTap: quizOsiFunction,
              )
            : Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Images.boy10,
                  height: height(160),
                  width: width(145),
                ),
              ),
        SizedBox(
          width: width(30),
        ),
        isFirstRow == true
            ? Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Images.boy9,
                  height: height(160),
                  width: width(145),
                ),
              )
            : ContainerRowCard(
                firstText: "الصح والخطأ",
                secondText: 'اسئلة ',
                thirdText: 'كويز ',
                firstOnTap:trueFalseQuestionFunction,
                secondOnTap: trueFalseQuizFunction,
              )
      ],
    );
  }
}
