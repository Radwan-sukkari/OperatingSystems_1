import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/favourite_widget.dart';
import 'package:operating_systems/core/app/flush_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/injection/injection.dart';
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
    return BlocProvider.value(
      value: getIt<FavouriteBloc>()..add(GetFavouriteEvent()),
      child: Container(
        width: width(370),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white38,
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: width(20), horizontal: height(20)),
            child: ColumnAnimations(
                duration: 200,
                curve: Curves.easeIn,
                columnContent: [
                  FavouriteWidget(question: question),
                  SizedBox(
                    height: height(10),
                  ),
                  QuestionOsiCardWidget(
                    questionEnglish: question.questionEn,
                    questionArabic: question.questionAr,
                  ),
                  // Answers
                  AnswerListViewStudyWidget(
                    answers: question.answers,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        question.description ?? "",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.w500),
                      ))
                ],
                verticalOffset: 0,
                horizontalOffset: 350)),
      ),
    );
  }
}
