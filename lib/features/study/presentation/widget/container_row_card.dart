import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/presentation/widget/container2_row_card.dart';

class ContainerRowCard extends StatelessWidget {
  const ContainerRowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return         Container(
        height: height(200),
        width: width(180),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("الموقع osi"),
              SizedBox(
                height: height(25),
              ),
              Container2RowCard(alignmentGeometry: Alignment.topRight,)   ,
              Container2RowCard(alignmentGeometry: Alignment.topLeft,)   ,
            ],
          ),
        ));

  }
}
