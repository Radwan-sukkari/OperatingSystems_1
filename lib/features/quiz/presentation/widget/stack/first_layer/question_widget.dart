import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final bool isArabic;
  const QuestionWidget(
      {super.key,
      required this.question, required this.isArabic,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(280),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Color(0xff205781).withOpacity(0.9), width: 1.5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(
    question,
          textDirection: isArabic==false?TextDirection.ltr:TextDirection.rtl,style: Theme.of(context).textTheme.titleMedium!.copyWith(
    color: Theme.of(context).colorScheme.shadow,
    fontWeight: FontWeight.w500)
      ),
    ));
  }
}
