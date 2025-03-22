import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class Container2RowCard extends StatelessWidget {
  final AlignmentGeometry alignmentGeometry;
  final String text;
  final VoidCallback onTap;
  const Container2RowCard({super.key, required this.alignmentGeometry, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return               Align(
      alignment: alignmentGeometry,
      child:
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: height(60),
          width: width(60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primary),
          child: Align(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
