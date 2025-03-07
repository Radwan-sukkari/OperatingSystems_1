import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/presentation/widget/about_subject.dart';
import 'package:operating_systems/features/study/presentation/widget/about_subject_container.dart';
import 'package:operating_systems/resources/resources.dart';

class HomePageScreen extends StatelessWidget {
  static const String name = 'home_page_screen';
  static const String path = '/home_page_screen';

  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(top: height(30),right: width(16),left: width(16)),
            child: Column(
              children: [
                AboutSubjectContainer(),
              ],
            ),
          ),
        ));
  }
}
