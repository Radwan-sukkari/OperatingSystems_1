import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/result/result_card.dart';

import '../../pages/show_in_correct_answer.dart';

class ResultColumn extends StatelessWidget {
  final int correctAnswer;
  final int inCorrectAnswer;
  final int questionLength;
  final double percentage;
  final List<Question>inCorrectAnswerList;

  const ResultColumn({super.key, required this.correctAnswer, required this.inCorrectAnswer, required this.questionLength, required this.percentage, required this.inCorrectAnswerList});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultCard(
          correctAnswer: correctAnswer,
          inCorrectAnswer: inCorrectAnswer,
          questionLength: questionLength,
          percentage: percentage,
        ),
        SizedBox(height: height(20),),
        Row(
          children: [
            GestureDetector(
              onTap: (){
                context.pop(context);
              },
              child:
              Container(
                height: height(50),
                width: width(150),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "العودة للكويز",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                context.pushNamed(IncorrectAnswersScreen.name,extra: {
                  "inCorrectAnswerList":inCorrectAnswerList
                });
              },
              child:
              Container(
                height: height(50),
                width: width(150),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "الاسئلة الخاطئة",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )


      ],
    );
  }
}
