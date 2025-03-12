import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/answer_widget.dart';

class AnswersList extends StatelessWidget {
  final List<Answer> answers;
  final bool isArabic;

  const AnswersList({super.key, required this.answers, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return AnswerWidget(
              index: index,
              answer: isArabic == false
                  ? answers[index].answerEn
                  : answers[index].answerAr, isArabic: isArabic,
            );
          },
        ),
      ],
    );
  }
}
