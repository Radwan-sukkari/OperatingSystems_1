import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/presentation/widget/about_subject.dart';
import 'package:operating_systems/resources/resources.dart';

class AboutSubjectContainer extends StatelessWidget {
  const AboutSubjectContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(200),
      width: width(355),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            Images.boy,
            height: height(200),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "خلينا نتعرف شوي عن  ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height(5),
              ),
              Text(
                " المادة وشلون بتجي الأسئلة ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height(15),
              ),
              AboutSubject()
            ],
          )
        ],
      ),
    );
  }
}
