import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    duration: const Duration(seconds: 6),
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
