import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class SecondLayerStudyWidget extends StatelessWidget {
  final int questionNumber;
final String chapter;
  const SecondLayerStudyWidget({super.key, required this.questionNumber, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: height(-50),
      child: Column(
        children: [
          Container(
            width: width(160),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xff205781))),
            child: Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: height(4)),
                child: Column(
                  children: [
                    Text(
                      "السؤال $questionNumber",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).shadowColor,
                          ),
                    ),
                    Text(
                      "$chapter",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).shadowColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
