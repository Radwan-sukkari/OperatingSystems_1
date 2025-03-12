import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class AnswerWidget extends StatelessWidget {
  final int index;
  final String answer;
  final bool isArabic;

  const AnswerWidget(
      {super.key,
      required this.index,
      required this.answer,
      required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width(280),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xff205781).withOpacity(0.9),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Row(
                mainAxisAlignment: isArabic == true
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isArabic == false
                      ? Flexible(
                          child: Text(
                            answer,
                            textAlign: TextAlign.left,
                            softWrap: true,
                            overflow: TextOverflow
                                .visible, // Prevents text from being clipped
                          ),
                        )
                      : Container(
                          height: height(25),
                          width: width(25),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                  SizedBox(
                    width: width(10),
                  ),
                  isArabic == false
                      ? Container(
                          height: height(25),
                          width: width(25),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : Flexible(
                          child: Text(
                            answer,
                            textAlign: isArabic == true
                                ? TextAlign.right
                                : TextAlign.left,
                            softWrap: true,
                            overflow: TextOverflow
                                .visible, // Prevents text from being clipped
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
