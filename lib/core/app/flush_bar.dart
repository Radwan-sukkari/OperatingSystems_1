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
    padding: EdgeInsets.all(12),
    borderRadius: BorderRadius.circular(8),
  ).show(context);
}
