import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class PreviousAndNextQuestion extends StatelessWidget {
  final VoidCallback previousQuestion;
  final VoidCallback nextQuestion;

  const PreviousAndNextQuestion(
      {super.key, required this.previousQuestion, required this.nextQuestion});

  @override
  Widget build(BuildContext context) {
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
                color: Theme
                    .of(context)
                    .primaryColor),
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
        InkWell(
          onTap: nextQuestion,
          child: Container(
            height: height(40),
            width: width(40),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme
                    .of(context)
                    .primaryColor),
            child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );

  }
}
