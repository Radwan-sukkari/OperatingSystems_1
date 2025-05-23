import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/comparisons_card/compaision_card.dart';

class ComparisonsScreen extends StatelessWidget {
  final List<Comparison> comparisons;
  static const String name = 'comparisons_screen';
  final String title;
  static const String path = '/comparisons_screen';

  const ComparisonsScreen({super.key, required this.comparisons, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: title,isBack: true,),
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Center(
        child: Padding(
            padding: EdgeInsets.only(
                top: height(0), right: width(15), left: width(15)),
            child: Column(
              children: [
                Text(
                    "ملاحظة يمكنك تمرير الجدول افقيا لرؤية محتوى الجدول ككل ويمكنك تمرير الخانة الواحدة عموديا لرؤية محتواها كاملا و في حال كانت المقارنة تحتوي على رسمة يمكنك الضغط على الرسمة لرؤيتها بشكل افضل",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.w500),),
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
