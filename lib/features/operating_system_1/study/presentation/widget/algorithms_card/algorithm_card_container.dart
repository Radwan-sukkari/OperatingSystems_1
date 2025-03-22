import 'package:flutter/material.dart';

class AlgorithmCardContainer extends StatelessWidget {
  final List<String> list;

  const AlgorithmCardContainer({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            list.length,
            (index) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18),
                  children: _buildTextSpans(list[index], context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔍 **تحليل النص وإعطاء لون مختلف للأرقام و `;`**
  List<TextSpan> _buildTextSpans(String text, BuildContext context) {
    final List<TextSpan> spans = [];
    final RegExp regex = RegExp(r'(\d+|;)'); // تحديد الأرقام و `;` فقط
    final matches = regex.allMatches(text);

    int lastMatchEnd = 0;

    for (final match in matches) {
      /// إضافة النص قبل الرقم أو `;`
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: TextStyle(color: Theme.of(context).primaryColor),
        ));
      }

      /// إضافة الرقم أو `;` باللون الأحمر
      spans.add(TextSpan(
        text: match.group(0),
        style: const TextStyle(color: Colors.red),
      ));

      lastMatchEnd = match.end;
    }

    /// إضافة أي نص متبقي بعد آخر تطابق
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: TextStyle(color: Theme.of(context).primaryColor),
      ));
    }

    return spans;
  }
}
