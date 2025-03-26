import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/third_layer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/definition_card.dart';

class DefinitionsScreen extends StatelessWidget {
  final List<Definition> definitions;

  static const String name = 'definitions_screen';
  static const String path = '/definitions_screen';

  const DefinitionsScreen({super.key, required this.definitions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Padding(
          padding: EdgeInsets.only(
              right: width(16), left: width(16), top: height(70)),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    " تعاريف الملف",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600),
                  )),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    itemCount: definitions.length,
                    itemBuilder: (context, index) {
                      return DefinitionCard(
                        definition: definitions[index],
                      );
                    }),
              ),
              SizedBox(height: height(15),)
            ],
          )),
    );
  }
}
