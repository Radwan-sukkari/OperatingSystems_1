import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/answer_card_study_widget.dart';

class AnswerListViewStudyWidget extends StatelessWidget {
  final List<Answer> answers;

  const AnswerListViewStudyWidget({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (context, index2) {
        final answer = answers[index2];
        return AnswerCardStudyWidget(
          answer: answer,
          index2: index2,
        );
      },
    );
  }
}
