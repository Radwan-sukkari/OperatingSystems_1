import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/favourite/presentation/manager/favourite/favourite_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/answer_list_view_study_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'question_osi_card_widget.dart';

class FirstLayerStudyWidget extends StatelessWidget {
  final Question question;

  const FirstLayerStudyWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(370),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white38,
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width(15), vertical: height(20)),
        child: Column(
          children: [
            QuestionOsiCardWidget(
              questionEnglish: question.questionEn,
              questionArabic: question.questionAr,
            ),
            // Answers
            AnswerListViewStudyWidget(
              answers: question.answers,
            )
          ],
        ),
      ),
    );
  }
}
