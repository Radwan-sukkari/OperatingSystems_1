import 'package:flutter/material.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/generated/assets.dart';
import '../../../../../core/app/app_app_bar.dart';
import '../../../../../core/app/size.dart';
import '../widget/result/resullt_column.dart';

class ResultPage extends StatelessWidget {
  static const String name = 'result_screen';
  static const String path = '/result_screen';
  final int correctAnswer;
  final int inCorrectAnswer;
  final int questionLength;
  final List<Question> incorrectAnswerList;

  const ResultPage({
    super.key,
    required this.correctAnswer,
    required this.inCorrectAnswer,
    required this.questionLength,
    required this.incorrectAnswerList
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (correctAnswer / questionLength) * 100;
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surfaceTint,
      appBar: AppAppBar(
        title: "نتائج الكويز",
      ),
      body: Padding(
          padding: EdgeInsets.only(
              top: height(120), left: width(20), right: width(20)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ResultColumn(
                correctAnswer: correctAnswer,
                inCorrectAnswer: inCorrectAnswer,
                questionLength: questionLength,
                percentage: percentage, inCorrectAnswerList: incorrectAnswerList,
              ),
              Positioned(
                  top: height(-115),
                  child: Image.asset(
                    Assets.imagesResult2,
                    width: width(150),
                  )),
              Positioned(
                  bottom: height(-20),
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    Assets.imagesResult,
                    height: height(300),
                    width: width(150),
                  ))
            ],
          )),
    );
  }
}
