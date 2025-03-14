import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/presentation/widget/container2_row_card.dart';

class ContainerRowCard extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  final VoidCallback firstOnTap;
  final VoidCallback secondOnTap;

  const ContainerRowCard({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
    required this.firstOnTap,
    required this.secondOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(
                firstText,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height(25),
              ),
              Container2RowCard(
                alignmentGeometry: Alignment.topRight,
                text: secondText,
                onTap: firstOnTap,
              ),
              Container2RowCard(
                  alignmentGeometry: Alignment.topLeft,
                  text: thirdText,
                  onTap: secondOnTap),
            ],
          ),
        ));
  }
}
