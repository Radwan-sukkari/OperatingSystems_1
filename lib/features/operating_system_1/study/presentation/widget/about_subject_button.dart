import 'package:flutter/material.dart';

class AboutSubjectButton extends StatelessWidget {
  final String title;
  final VoidCallback function;

  const AboutSubjectButton(
      {super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: function,
      child: Text(title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 1.2,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Theme.of(context).shadowColor)),
    );

  }
}
