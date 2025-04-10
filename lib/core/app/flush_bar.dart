import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushBar(BuildContext context, String message) {
  Flushbar(
    messageText: Text(
      message,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
    ),
    duration: const Duration(seconds: 4),
    titleColor: Colors.black,
    backgroundColor: Theme.of(context).colorScheme.primary,
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(12),
    borderRadius: BorderRadius.circular(8),
    animationDuration: const Duration(milliseconds: 150),
    forwardAnimationCurve: Curves.easeIn,
    reverseAnimationCurve: Curves.easeOut,
    flushbarStyle: FlushbarStyle.FLOATING,
    boxShadows: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 8,
        spreadRadius: 1,
        offset: Offset(0, 4),
      ),
    ],
  ).show(context);
}
