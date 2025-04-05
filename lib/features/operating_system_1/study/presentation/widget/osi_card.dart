import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/favourite/presentation/manager/favourite/favourite_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/first_layer_study_widget.dart';
import 'package:operating_systems/resources/resources.dart';

import 'second_layer_study_widget.dart';
import 'third_layer_study_widget.dart';

class OsiCard extends StatelessWidget {
  final Question question;
  final int index;

  const OsiCard({super.key, required this.question, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavouriteBloc>()..add(GetFavouriteEvent()),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width(15), vertical: height(65)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            FirstLayerStudyWidget(question: question),
            SecondLayerStudyWidget(questionNumber: index + 1, chapter: question.chapterAr,),
            ThirdLayerStudyWidget(),
            BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (context, state) {
                final favouriteQuestions = state.getFavouriteState.data ?? [];
                final isFavourite = favouriteQuestions.any((favQuestion) =>
                    favQuestion.questionAr == question.questionAr);
                return Positioned(
                  left: 0,
                  top: -40,
                  child: IconButton(
                    onPressed: () {
                      if (isFavourite) {
                        context
                            .read<FavouriteBloc>()
                            .add(RemoveFavouriteEvent(id: question.questionAr));
                      } else {
                        context
                            .read<FavouriteBloc>()
                            .add(AddFavouriteEvent(question: question));
                      }
                    },
                    icon: Icon(
                      Icons.star,
                      size: 40,
                      color: isFavourite ? Colors.amber : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
