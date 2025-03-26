import 'package:flutter/material.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/third_layer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/first_layer.dart';

import '../../../../../../../core/app/size.dart';

class DefinitionCard extends StatelessWidget {
  final Definition definition;
  const DefinitionCard({super.key, required this.definition});

  @override
  Widget build(BuildContext context) {
    return                         Padding(
      padding: EdgeInsets.only(top: height(86)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          DefinitionFirstLayer(definition: definition,),
          ThirdLayer()
        ],
      ),
    );

  }
}
