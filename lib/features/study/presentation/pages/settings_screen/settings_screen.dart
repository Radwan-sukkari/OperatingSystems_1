import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/study/presentation/pages/settings_screen/about_the_app.dart';
import 'package:operating_systems/features/study/presentation/pages/settings_screen/about_the_subject.dart';
import 'package:operating_systems/features/study/presentation/widget/setting_widget.dart';

import '../../../../../resources/resources.dart';

class SettingsScreen extends StatelessWidget {
  static const String name = 'settings_screen';
  static const String path = '/settings_screen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Padding(
        padding: EdgeInsets.only(
            right: width(15), left: width(15), bottom: height(50)),
        child: ColumnAnimations(
            mainAxisAlignment: MainAxisAlignment.center,
            duration: 150,
            curve: Curves.easeIn,
            columnContent: [
              Align(
                alignment: Alignment.topCenter,
                child: Transform.rotate(
                  angle: 6.5 * (3.1415926535 / 180),
                  child: Image.asset(
                    Images.logo,
                    height: height(220),
                  ),
                ),
              ),
              SizedBox(
                height: height(30),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: height(300),
                  width: width(320),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white30),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SettingWidget(
                          name: 'عن المادة',
                          function: () {
                            context.pushNamed(AboutTheSubject.name);
                          },
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                        SettingWidget(
                          name: 'عن التطبيق',
                          function: () {
                            context.pushNamed(AboutTheApp.name);
                          },
                        ),
                        SizedBox(
                          height: height(20),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
            verticalOffset: 300,
            horizontalOffset: 0),
      ),
    );
  }
}
