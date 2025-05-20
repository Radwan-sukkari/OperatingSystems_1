import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/manager/answer_selected_bloc.dart';

class PreviousAndNextQuestion extends StatelessWidget {
  final VoidCallback previousQuestion;
  final VoidCallback nextQuestion;
  final bool isShowNextQuestionCircle;

  const PreviousAndNextQuestion(
      {super.key,
      required this.previousQuestion,
      required this.nextQuestion,
      required this.isShowNextQuestionCircle});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleBloc, ToggleState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: previousQuestion,
              child: Container(
                height: height(40),
                width: width(40),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(right: width(5)),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
            isShowNextQuestionCircle
                ? InkWell(
                    onTap: nextQuestion,
                    child: Container(
                      height: height(40),
                      width: width(40),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: Center(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white,
                      )),
                    ),
                  )
                : SizedBox.shrink()
          ],
        );
      },
    );
  }
}
