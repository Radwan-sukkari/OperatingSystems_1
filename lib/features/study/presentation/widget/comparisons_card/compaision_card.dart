import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/third_layer.dart';
import 'package:operating_systems/features/study/data/model/comparisons_model.dart';

class ComparisonsWidget extends StatelessWidget {
  final Comparison comparison;

  const ComparisonsWidget({super.key, required this.comparison});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First column (non-scrollable horizontally, but cells can scroll vertically)
              DataTable(
                border: TableBorder.all(width: 1.3),
                dataRowMaxHeight: height(250),
                columns: [
                  DataColumn(label: Text(comparison.tableTitle)),
                ],
                rows: [
                  for (int i = 0; i < comparison.firstColumn.length; i++)
                    DataRow(cells: [
                      DataCell(
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 65,
                              child: Text(
                                comparison.firstColumn[i],
                                softWrap: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                ],
              ),
              // Second and third columns (scrollable horizontally, cells scroll vertically)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(width: 1.3),
                    dataRowHeight: height(250),
                    columns: [
                      for (int i = 0; i < comparison.mainColumnHeadings.length; i++)
                        DataColumn(
                          label: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 65,
                                child: Text(
                                  comparison.mainColumnHeadings[i],
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                    rows: [
                      for (int i = 0; i < comparison.rows.length; i++)
                        DataRow(cells: [
                          for (int j = 0; j < comparison.rows[i].length; j++)
                            DataCell(
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 100,
                                    child: Text(
                                      comparison.rows[i][j],
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Positioned image
          const ThirdLayer(),
        ],
      ),
    );
  }
}