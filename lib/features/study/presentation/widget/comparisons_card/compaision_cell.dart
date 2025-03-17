import 'package:flutter/material.dart';

class ComparisonsCell extends StatelessWidget {
  final String title;
  const ComparisonsCell({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
      child: SizedBox(
        width: 50,
        child:  Text(
          title,
          softWrap: true,
        ),
      ),
    );

  }
}
