import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';
import 'dart:math' as math;

class SectionWidget extends StatelessWidget {
  final Widget widget;
  final String name;
  final Widget image;

  const SectionWidget({super.key, required this.widget, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    bool isLongText = name.split(" ").length > 10; // التحقق إذا كان النص طويلًا

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(20),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: isLongText
                    ? SizedBox(
                  height: height(20),
                  child: Marquee(
                    text: name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.shadow,
                      fontWeight: FontWeight.w600,
                    ),
                    scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 50.0,
                    velocity: 30.0,
                    pauseAfterRound: Duration(seconds: 2),
                    startPadding: 10.0,
                    accelerationDuration: Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                )
                    : Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.shadow,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          image,
            ],
          ),
          widget
        ],
      ),
    );
  }
}
