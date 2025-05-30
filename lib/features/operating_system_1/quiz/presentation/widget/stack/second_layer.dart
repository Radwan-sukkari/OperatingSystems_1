import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class SecondLayer extends StatelessWidget {
  final String chapter;
  final int questionNumberInTheChapter;
  final int questionIReceived;

  const SecondLayer({
    super.key,
    required this.chapter,
    required this.questionNumberInTheChapter,
    required this.questionIReceived,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -35,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Container(
            height: height(62),
            width: width(160),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xff205781))),
            child: Column(
              children: [
                Text(
                  "  $chapter",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.shadow,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height(2),
                ),
                Text(
                  "$questionIReceived/$questionNumberInTheChapter question",
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.shadow,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
