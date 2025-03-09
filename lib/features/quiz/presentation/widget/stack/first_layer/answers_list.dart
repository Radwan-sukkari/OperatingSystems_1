import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/answer_widget.dart';

class AnswersList extends StatelessWidget {
  const AnswersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return AnswerWidget(index: index);
          },
        ),
      ],
    );
  }
}
