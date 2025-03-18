import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/study/presentation/widget/comparisons_card/compaision_card.dart';
import 'package:operating_systems/resources/resources.dart';

class ComparisonsScreen extends StatelessWidget {
  final List<Comparison> comparisons;
  static const String name = 'comparisons_screen';
  static const String path = '/comparisons_screen';

  const ComparisonsScreen({super.key, required this.comparisons, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Center(
        child: Padding(
            padding: EdgeInsets.only(
                top: height(40), right: width(15), left: width(15)),
            child: Column(
              children: [
                Text(
                    "ملاحظة يمكنك تمرير الجدول افقيا لرؤية محتوى الجدول ككل ويمكنك تمرير الخانة الواحدة عموديا لرؤية محتواها كاملا",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                      itemCount: comparisons.length,
                      itemBuilder: (context, index) {
                        return ComparisonsWidget(
                          comparison: comparisons[index],
                        );
                      }),
                ),
              ],
            )),
      ),
    );
  }
}
