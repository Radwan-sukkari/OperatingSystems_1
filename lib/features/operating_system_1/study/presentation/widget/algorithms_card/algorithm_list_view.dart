
import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/algorithms_card/algorithm_card.dart';

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
            return Padding(
              padding:  EdgeInsets.only(top: height(32)),
              child: AlgorithmCard(
                  index: index,
                  list: index == 0
                      ? algorithmBody[0].system
                      : index == 1
                          ? algorithmBody[0].thread1
                          : algorithmBody[0].thread2),
            );
          }),
    );
  }
}
