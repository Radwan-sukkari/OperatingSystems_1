import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/size.dart';

import '../../../manager/answer_selected_bloc.dart';

class AnswerWidget extends StatelessWidget {
  final int index;
  final String answer;
  final bool isArabic;

  const AnswerWidget({
    super.key,
    required this.index,
    required this.answer,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleBloc, ToggleState>(
      builder: (context, state) {
        Color borderColor = Theme.of(context).colorScheme.primary;

        if (state is AnswerValidated) {
          if (state.selectedIndex == index) {
            borderColor = state.isCorrect ? Colors.green : Colors.red;
          } else if (index == state.correctAnswerIndex) {
            borderColor = Colors.green;
          }
        } else if (state is ToggleInitial) {
          if (state.selectedIndex == index) {
            borderColor = Colors.blue; // Highlight selected answer
          }
        }

        return GestureDetector(
          onTap: () {
            context.read<ToggleBloc>().add(SelectAnswer(index));
          },
          child: Container(
            width: width(280),
            margin: EdgeInsets.only(bottom: height(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: borderColor,
                width: 1.8,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Row(
                mainAxisAlignment: isArabic ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  if (!isArabic)
                    Flexible(
                      child: Text(
                        answer,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  SizedBox(width: width(10)),
                  Container(
                    height: height(25),
                    width: width(25),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  if (isArabic)
                    Flexible(
                      child: Text(
                        answer,
                        textAlign: TextAlign.right,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}