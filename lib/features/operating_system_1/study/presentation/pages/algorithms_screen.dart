import 'package:flutter/material.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/algorithms_card/algorithm_list_view.dart';

class AlgorithmsScreens extends StatelessWidget {
  final Algorithm algorithm;
  static const String name = 'algorithms_screen';
  static const String path = '/algorithms_screen';

  const AlgorithmsScreens({super.key, required this.algorithm});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,

      body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 100, right: 20),
          child: Column(
            children: [
              Text(algorithm.examQuestion),
              AlgorithmListView(algorithmBody: algorithm.algorithmBody)
            ],
          )),
    );
  }
}
