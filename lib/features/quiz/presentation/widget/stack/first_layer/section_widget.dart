import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';

class SectionWidget extends StatelessWidget {
  final Widget widget;
  final String name;
  const SectionWidget({super.key, required this.widget, required this.name});

  @override
  Widget build(BuildContext context) {
    return         Padding
      (
      padding:
      EdgeInsets.symmetric(horizontal: width(20), vertical: height(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.shadow,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                Images.boy2,
                height: height(210),
              ),
            ],
          ),
          widget
        ],
      ),
    );

  }
}
