import 'package:flutter/material.dart';

class ComparisonsCell extends StatelessWidget {
  final String title;
  final double width;
  final TextStyle style;
  const ComparisonsCell({super.key, required this.title, required this.width, required this.style});

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
      child: SizedBox(
        width: width,
        child:  Text(
          title,
          softWrap: true,
          style:style,
        ),
      ),
    );

  }
}
