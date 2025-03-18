import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/presentation/widget/comparisons_card/compaision_cell.dart';

class ColumHeadlinesAndTableContentWidget extends StatelessWidget {
  final List<String> mainColumnHeadings;
  final List<List<String>> rows;

  const ColumHeadlinesAndTableContentWidget(
      {super.key, required this.mainColumnHeadings, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(
              width: 0.8, color: Theme.of(context).colorScheme.shadow),
          dataRowMaxHeight: height(230),
          columns: [
            for (int i = 0; i < mainColumnHeadings.length; i++)
              DataColumn(
                  label: ComparisonsCell(
                title: mainColumnHeadings[i],
                width: width(50),
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer),
              )),
          ],
          rows: [
            for (int i = 0; i < rows.length; i++)
              DataRow(cells: [
                for (int j = 0; j < rows[i].length; j++)
                  DataCell(ComparisonsCell(
                      title: rows[i][j],
                      width: width(100),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.w400,
                          ))),
              ]),
          ],
        ),
      ),
    );
  }
}
