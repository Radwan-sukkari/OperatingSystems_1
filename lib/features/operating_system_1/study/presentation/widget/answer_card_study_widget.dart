import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';

class AnswerCardStudyWidget extends StatelessWidget {
  final Answer answer;
  final int index2;

  const AnswerCardStudyWidget(
      {super.key, required this.answer, required this.index2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  answer.answerEn,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: answer.isCorrect == false
                          ? Theme.of(context).primaryColor
                          : Colors.green,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: width(8)),
              Container(
                height: height(25),
                width: width(25),
                decoration: BoxDecoration(
                  color: answer.isCorrect == false
                      ? Theme.of(context).primaryColor
                      : Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "${index2 + 1}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height(6)),
          // Answer in Arabic
          Row(
            children: [
              Container(
                height: height(25),
                width: width(25),
                decoration: BoxDecoration(
                  color: answer.isCorrect == false
                      ? Theme.of(context).shadowColor
                      : Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "${index2 + 1}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: width(8)),
              Flexible(
                child: Text(
                  answer.answerAr,
                  textAlign: TextAlign.right,
                  softWrap: true,
                  // Allow text to wrap
                  overflow: TextOverflow.visible,
                  // Prevent clipping
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color:answer.isCorrect == false? Theme.of(context).shadowColor:Colors.green,
                      fontWeight: FontWeight.w500
                ),)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
