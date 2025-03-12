import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class OneItemShimmer extends StatelessWidget {
  final double itemHeight;
  final double itemWidth;
  final double? radius; // اخ
  final double borderWidth;
  final Widget? child;

  const OneItemShimmer({
    super.key,
    required this.itemHeight,
    required this.itemWidth,
    this.radius,
    this.borderWidth = 0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(itemHeight),
      width: width(itemWidth),
      decoration: BoxDecoration(
        color: borderWidth == 0 ? Colors.white : null,
        borderRadius: radius != null ? BorderRadius.circular(radius!) : null,
        border: borderWidth > 0
            ? Border.all(color: Colors.white, width: borderWidth)
            : null, // يتم التعيين فقط عند وجود عرض للحدود
      ),
      child: child ?? const SizedBox(),
    );
  }
}
