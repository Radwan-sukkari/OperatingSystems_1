import 'package:flutter/material.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/answer_widget.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class AnswersList extends StatelessWidget {
  final List<Answer> answers;
  final bool isArabic;

  const AnswersList({
    super.key,
    required this.answers,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: AnswerWidget(
                  index: index,
                  answer: isArabic ? answers[index].answerAr : answers[index].answerEn,
                  isArabic: isArabic,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
