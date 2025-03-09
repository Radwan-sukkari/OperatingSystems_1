import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class AnswerWidget extends StatelessWidget {
  final int index;

  const AnswerWidget({super.key, required this.index});

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
                mainAxisAlignment: MainAxisAlignment.end,
                //  crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Flexible(
                    child: Text(
                      " Ls resourcesinux . $index",
                      textAlign: TextAlign.left,
                      softWrap: true,
                      overflow: TextOverflow
                          .visible, // Prevents text from being clipped
                    ),
                  ),
                  SizedBox(width: width(8)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: height(25),
                      width: width(25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Center(
                        child: Text(
                          "A",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
