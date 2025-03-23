import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/first_layer_study_widget.dart';

import 'second_layer_study_widget.dart';
import 'third_layer_study_widget.dart';

class OsiCard extends StatelessWidget {
  final Question question;
  final int index;

  const OsiCard({super.key, required this.question, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width(15), vertical: height(40)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FirstLayerStudyWidget(
            question: question,
          ),
          SecondLayerStudyWidget(
            questionNumber: index + 1,
          ),
          ThirdLayerStudyWidget(),
        ],
      ),
    );
  }
}
