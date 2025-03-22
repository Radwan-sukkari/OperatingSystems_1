import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class QuestionOsiCardWidget extends StatelessWidget {
  final String questionEnglish;
  final String questionArabic;
  const QuestionOsiCardWidget({super.key, required this.questionEnglish, required this.questionArabic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
questionEnglish,                textAlign: TextAlign.left,
                softWrap: true,
                // Allow text to wrap
                overflow: TextOverflow.visible,
                // Prevent clipping
                style:
                TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
        SizedBox(height: height(8)),
        Row(
          children: [
            Flexible(
              child: Text(
                questionArabic,
                textDirection: TextDirection.rtl,
                softWrap: true,
                overflow: TextOverflow.visible,
                style:
                TextStyle(color: Theme.of(context).shadowColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
