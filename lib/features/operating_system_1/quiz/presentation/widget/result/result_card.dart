import 'package:flutter/material.dart';

import '../../../../../../core/app/size.dart';

class ResultCard extends StatelessWidget {
  final int correctAnswer;
  final int inCorrectAnswer;
  final int questionLength;
  final double percentage;

  const ResultCard({super.key, required this.correctAnswer, required this.inCorrectAnswer, required this.questionLength, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return       Container(
      height: height(280),
      width: width(400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white38,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(25), vertical: width(25)),
        child: Column(
          children: [
            CircularProgressIndicator(
              value: percentage / 100,
              semanticsLabel: 'Quiz progress',
              strokeWidth: 10,
              color: Colors.green,
              backgroundColor: Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              "${percentage.toStringAsFixed(1)}% ",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "عدد الاجابات الصحيحة :      $correctAnswer",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height(10),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "عدد الاجابات الخاطئة :       $inCorrectAnswer",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height(10),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "عدد الأسئلة الكلي  :          $questionLength",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
