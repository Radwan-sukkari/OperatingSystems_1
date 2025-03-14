import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/presentation/widget/container_row_card.dart';
import 'package:operating_systems/resources/resources.dart';

class HomePageRowWidget extends StatelessWidget {
  final bool isFirstRow;

  const HomePageRowWidget({super.key, required this.isFirstRow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFirstRow == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isFirstRow == true
            ? ContainerRowCard()
            : Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Images.boy10,
                  height: 180,
                  width: 170,
                ),
              ),
        isFirstRow == true
            ? Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Images.boy9,
                  height: 180,
                  width: 170,
                ),
              )
            : ContainerRowCard()
      ],
    );
  }
}
