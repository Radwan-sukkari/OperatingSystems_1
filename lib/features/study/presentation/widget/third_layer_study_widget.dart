import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';

class ThirdLayerStudyWidget extends StatelessWidget {
  const ThirdLayerStudyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Positioned(
      right: 0,
      top: -75,
      child: Image.asset(
        Images.boyQuiz,
        height: height(90),
        width: width(90),
      ),
    );

  }
}
