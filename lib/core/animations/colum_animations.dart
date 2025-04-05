import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:operating_systems/core/app/size.dart';

class ColumnAnimations extends StatelessWidget {
  final int duration;
  final Curve curve;
  final List<Widget> columnContent;
  final double verticalOffset;
  final double horizontalOffset;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const ColumnAnimations({
    super.key,
    required this.duration,
    required this.curve,
    required this.columnContent,
    required this.verticalOffset,
    required this.horizontalOffset,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: AnimationConfiguration.toStaggeredList(
          duration: Duration(milliseconds: duration),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: verticalOffset,
            horizontalOffset: horizontalOffset,
            child: FadeInAnimation(
              curve: curve,
              child: widget,
            ),
          ),
          children: columnContent,
        ),
      ),
    );
  }
}
