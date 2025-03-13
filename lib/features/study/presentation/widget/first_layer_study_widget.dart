import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/study/presentation/widget/answer_list_view_study_widget.dart';
import 'package:operating_systems/features/study/presentation/widget/question_osi_card_widget.dart';

class FirstLayerStudyWidget extends StatelessWidget {
  final Question question;

  const FirstLayerStudyWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return           Container(
      width: width(370),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white38,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(15), vertical: height(20)),
        child: Column(
          children: [
            QuestionOsiCardWidget(questionEnglish: question.questionEn, questionArabic: question.questionAr,),
            // Answers
            AnswerListViewStudyWidget(answers: question.answers,)          ],
        ),
      ),
    );

  }
}
