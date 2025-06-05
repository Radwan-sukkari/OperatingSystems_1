import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/osi_card.dart';

import '../../../../../core/app/app_app_bar.dart';
import '../../../../../core/injection/injection.dart';
import '../manager/show_incoorect_answers/show_incorrect_answer_bloc.dart';

class IncorrectAnswersScreen extends StatelessWidget {
  static const String name = 'show_in_correct_answer_screen';
  static const String path = '/show_in_correct_answer_screen';
final List<Question>inCorrectAnswerList;
  const IncorrectAnswersScreen({super.key, required this.inCorrectAnswerList});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppAppBar(
          title: " الاسئلة الخاطئة",
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
                  itemCount: inCorrectAnswerList.length,
                  itemBuilder: (context, index) {
                    final question = inCorrectAnswerList[index];
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