import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';

class DefinitionFirstLayer extends StatelessWidget {
  final Definition definition;

  const DefinitionFirstLayer({super.key, required this.definition});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(350),
      decoration: BoxDecoration(
          color: Colors.white38, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${definition.title} ( ${definition.titleEn} )",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.w500,
                    )),
            SizedBox(
              height: height(15),
            ),
            Text(definition.explain,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ))
          ],
        ),
      ),
    );
  }
}
