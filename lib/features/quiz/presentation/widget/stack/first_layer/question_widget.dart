import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

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
        child: Text("نا  يكتب نص السؤالنا  يكتب نص السؤالنا  يكتب نص السؤالنا  يكتب نص السؤالنا  يكتب نص السؤالهنا  يكتب نص السؤال"),
      ),
    );
  }
}
