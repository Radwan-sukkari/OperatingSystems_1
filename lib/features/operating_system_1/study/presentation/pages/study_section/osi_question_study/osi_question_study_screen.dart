import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/osi_card.dart';

class OsiQuestionStudyScreen extends StatelessWidget {
  final List<Question> questions;
  final String chapterEnglish;
  final String chapterArabic;
  static const String name = 'osi_question_study_screen';
  static const String path = '/osi_question_study_screen';

  const OsiQuestionStudyScreen({
    super.key,
    required this.questions,
    required this.chapterEnglish,
    required this.chapterArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: chapterArabic,
        isBack: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return OsiCard(
                    index: index,
                    question: question,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
