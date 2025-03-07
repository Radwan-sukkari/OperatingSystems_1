import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListViewAnimations extends StatelessWidget {
  final int itemCount;
  final Widget listViewBody;
  final int duration;
  final Curve curve;

  const ListViewAnimations(
      {super.key,
        required this.itemCount,
        required this.listViewBody,
        required this.duration,
        required this.curve});

  @override
  Widget build(BuildContext context) {
    return
      AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: duration),
            child: SlideAnimation(
              verticalOffset: 50.0,
              horizontalOffset: 0,
              curve: curve,
              child: FadeInAnimation(child: listViewBody),
            ),
          );
        },
      ),
    );
  }
}
