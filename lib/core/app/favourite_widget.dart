import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/flush_bar.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../features/favourite/presentation/manager/favourite/favourite_bloc.dart';

class FavouriteWidget extends StatelessWidget {
  final Question question;

  const FavouriteWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return                   Align(
      alignment: Alignment.bottomLeft,
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          final favouriteQuestions =
              state.getFavouriteState.data ?? [];
          final isFavourite = favouriteQuestions.any(
                  (favQuestion) =>
              favQuestion.questionAr == question.questionAr);
          return GestureDetector(
            onTap: () {
              if (isFavourite) {
                context.read<FavouriteBloc>().add(
                    RemoveFavouriteEvent(
                      fun:(){
                        showFlushBar(context, "تم حذف السؤال بنجاح ");
                      },
                      id: question.id,));
              } else {
                context
                    .read<FavouriteBloc>()
                    .add(AddFavouriteEvent(question: question,   fun:(){
                  showFlushBar(context, "تم اضافة السؤال بنجاح ");
                },));
              }
            },
            child: Icon(
              PhosphorIcons.star(PhosphorIconsStyle.fill),
              size: 40,
              color: isFavourite ? Colors.amber : Colors.grey,
            ),
          );
        },
      ),
    );

  }
}
