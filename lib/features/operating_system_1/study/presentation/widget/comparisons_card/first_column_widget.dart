import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/comparisons_card/compaision_cell.dart';

class FirstColumnWidget extends StatelessWidget {
  final String tableTitle;
  final List<String> firstColumn;

  const FirstColumnWidget(
      {super.key, required this.tableTitle, required this.firstColumn});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder.all(
          width: 0.8, color: Theme.of(context).colorScheme.shadow),
      dataRowMaxHeight: height(230),
      columns: [
        DataColumn(label: Text(tableTitle)),
      ],
      rows: [
        for (int i = 0; i < firstColumn.length; i++)
          DataRow(cells: [
            DataCell(ComparisonsCell(
              title: firstColumn[i],
              width: width(65),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onErrorContainer),
            )),
          ]),
      ],
    );
  }
}
