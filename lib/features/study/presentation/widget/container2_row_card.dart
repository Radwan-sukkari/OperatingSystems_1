import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class Container2RowCard extends StatelessWidget {
  final AlignmentGeometry alignmentGeometry;
  const Container2RowCard({super.key, required this.alignmentGeometry});

  @override
  Widget build(BuildContext context) {
    return               Align(
      alignment: alignmentGeometry,
      child:
      Container(
        height: height(60),
        width: width(60),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.primary),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                "اسئلة الموقع",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary),
              ),
            )),
      ),
    );

  }
}
