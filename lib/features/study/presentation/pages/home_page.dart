import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/presentation/widget/about_subject_container.dart';
import 'package:operating_systems/features/study/presentation/widget/home_page_row_widget.dart';

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
            padding: EdgeInsets.only(
              top: height(40),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width(20)),
                    child: AboutSubjectContainer(),
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HomePageRowWidget(
                    isFirstRow: true,
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  HomePageRowWidget(
                    isFirstRow: false,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
