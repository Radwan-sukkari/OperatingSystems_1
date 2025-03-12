import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';

class TableScreen extends StatelessWidget {
  static const String name = 'table_screen';
  static const String path = '/table_screen';

  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DataTable(
                border: TableBorder.all(color: Theme.of(context).primaryColor,width: 2), // إضافة حدود للجدول
                columns: [
                  DataColumn(
                      label: Text('المعرف',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('الاسم',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('العمر',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('محمد')),
                    DataCell(Text('25')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text(' ')),
                    DataCell(Text('30')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('سارة')),
                    DataCell(Text('22')),
                  ]),
                ],
              ),
              SizedBox(height: height(20),
         ),
              Image.asset(Images.boy3,height: height(200),width:width(200),)
            ],
          ),
        ),
      ),
    );
  }
}
