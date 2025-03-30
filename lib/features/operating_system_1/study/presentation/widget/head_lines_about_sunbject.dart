import 'package:flutter/material.dart';

class HeadLinesAboutSubject extends StatelessWidget {
  final String title;
  const HeadLinesAboutSubject({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return                 Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amberAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
              color: Theme.of(context).colorScheme.shadow,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

  }
}
