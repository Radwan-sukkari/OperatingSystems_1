import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/answers_list.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/question_widget.dart';

class FirstLayer extends StatelessWidget {
  const FirstLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(350),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height(40)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuestionWidget(),
              SizedBox(height: height(30)),
              AnswersList(),
              SizedBox(height: height(30)),
              MainButton(name: "اظهار الاجابة"),
              SizedBox(height: height(8)),
              MainButton(name: "اظهار الترجمة"),
            ],
          ),
        ),
      ),
    );
  }
}
