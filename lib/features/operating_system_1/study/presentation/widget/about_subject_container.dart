import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/about_subject.dart';
import 'package:operating_systems/resources/resources.dart';

class AboutSubjectContainer extends StatelessWidget {
  final String title1;
  final String title2;
  final VoidCallback function;

  const AboutSubjectContainer(
      {super.key,
      required this.title1,
      required this.title2,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(205),
      width: width(360),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: width(8)),
        child: Row(
          children: [
            Image.asset(
              Images.boy,
              height: height(120),
              width: width(120),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title1,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  height: height(5),
                ),
                Text(
                  title2,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  height: height(15),
                ),
                AboutSubject(
                  child: SmallButton(
                    text: " اضفط هنا",
                    size: Size(120.w, 30.h),
                    onPressed: function,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
