import 'package:flutter/material.dart';

class ExplainAboutSubject extends StatelessWidget {
  final String title;

  const ExplainAboutSubject({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).primaryColor,
            height: 1.5,
          ),
      textAlign: TextAlign.justify,
    );
  }
}
