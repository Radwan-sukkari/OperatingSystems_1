import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/third_layer.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/first_layer.dart';
import 'package:operating_systems/resources/resources.dart';
import 'dart:math' as math;

class DefinitionCard2 extends StatelessWidget {
  final String title;
  final String explain;
  final bool isYourAnswer;

  const DefinitionCard2(
      {super.key,
      required this.title,
      required this.explain,
      required this.isYourAnswer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height(86)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width(350),
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title  (${isYourAnswer == true ? "اجابتك" : " الاجابة الصحيحة"} )",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    height: height(15),
                  ),
                  Text(explain,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ))
                ],
              ),
            ),
          ),
          isYourAnswer == false
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
                ),
        ],
      ),
    );
  }
}
