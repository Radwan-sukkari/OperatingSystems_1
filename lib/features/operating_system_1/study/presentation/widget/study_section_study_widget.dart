import 'package:flutter/material.dart';

class StudySectionStudyWidget extends StatelessWidget {
  final String text;
  final VoidCallback fun;

  const StudySectionStudyWidget(
      {super.key, required this.text, required this.fun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
