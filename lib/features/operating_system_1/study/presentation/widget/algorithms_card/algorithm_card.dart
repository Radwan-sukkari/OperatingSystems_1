
import 'package:flutter/material.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/algorithms_card/algorithm_card_boy.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/algorithms_card/algorithm_card_container.dart';

class AlgorithmCard extends StatelessWidget {
  final int index;
  final List<String>list;
  const AlgorithmCard({super.key, required this.index, required this.list,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Align(
        alignment: index % 2 == 0 ? Alignment.topRight : Alignment.topLeft,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AlgorithmCardContainer(list: list,),
            AlgorithmCardBoy(
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}
