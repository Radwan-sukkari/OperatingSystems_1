import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/study/presentation/widget/algorithms_card/algorithm_card.dart';
import 'package:operating_systems/features/study/presentation/widget/algorithms_card/algorithm_card_boy.dart';
import 'package:operating_systems/features/study/presentation/widget/algorithms_card/algorithm_card_container.dart';

class AlgorithmListView extends StatelessWidget {
  final List<AlgorithmBody> algorithmBody;

  const AlgorithmListView({super.key, required this.algorithmBody});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return AlgorithmCard(
                index: index,
                list: index == 0
                    ? algorithmBody[0].system
                    : index == 1
                        ? algorithmBody[0].thread1
                        : algorithmBody[0].thread2);
          }),
    );
  }
}
