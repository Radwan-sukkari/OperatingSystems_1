import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class SecondLayerStudyWidget extends StatelessWidget {
  final int questionNumber;

  const SecondLayerStudyWidget({super.key, required this.questionNumber});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -32,
      right: 100,
      child: Column(
        children: [
          Container(
            height: height(37),
            width: width(160),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
                border:
                Border.all(color: Color(0xff205781))),
            child: Center(
              child: Text("السؤال $questionNumber",
                textDirection: TextDirection.ltr, style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color:Theme.of(context).shadowColor,),),
            ),
          ),
        ],
      ),
    );
  }
}
