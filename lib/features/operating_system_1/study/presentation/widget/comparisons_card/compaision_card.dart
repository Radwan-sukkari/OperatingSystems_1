import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/third_layer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/comparisons_card/colum_headlines_and_table_content_widget.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/comparisons_card/first_column_widget.dart';

class ComparisonsWidget extends StatelessWidget {
  final Comparison comparison;

  const ComparisonsWidget({super.key, required this.comparison});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: height(70),),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FirstColumnWidget(
                tableTitle: comparison.tableTitle,
                firstColumn: comparison.firstColumn,
              ),
              ColumHeadlinesAndTableContentWidget(
                mainColumnHeadings: comparison.mainColumnHeadings,
                rows: comparison.rows,
              )
            ],
          ),
          // Positioned image
          const ThirdLayer(),
        ],
      ),
    );
  }
}
