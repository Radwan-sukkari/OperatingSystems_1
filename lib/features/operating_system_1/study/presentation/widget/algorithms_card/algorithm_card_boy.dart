import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';
import 'dart:math' as math;

class AlgorithmCardBoy extends StatelessWidget {
  final int index;

  const AlgorithmCardBoy({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return index % 2 == 0
        ? Positioned(
            right: 0,
            top: -75,
            child: Image.asset(
              Images.boyQuiz,
              height: height(90),
              width: width(90),
            ),
          )
        : Positioned(
            left: 0,
            top: -75,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image.asset(
                Images.boyQuiz,
                height: height(90),
              ),
            ),
          );
  }
}
