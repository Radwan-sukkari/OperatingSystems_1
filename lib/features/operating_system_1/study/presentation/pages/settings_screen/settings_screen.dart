import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/choose_subject.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/favourite/presentation/pages/favourite_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/about_the_app.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/about_the_subject.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/setting_widget.dart';
import 'package:operating_systems/resources/resources.dart';


class SettingsScreen extends StatelessWidget {
  static const String name = 'settings_screen';
  static const String path = '/settings_screen';

  const SettingsScreen({super.key});

  Future<void> _saveAndNavigate(BuildContext context, String role,
      String route) async {
    const storage = FlutterSecureStorage();

    await storage.write(key: "role", value: role);
    context.goNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "الاعدادات",),
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surfaceTint,
      body: Padding(
        padding: EdgeInsets.only(
            right: width(15), left: width(15), top: height(20)),
        child: ColumnAnimations(
            duration: 150,
            curve: Curves.easeIn,
            columnContent: [
              Align(
                alignment: Alignment.topCenter,
                child: Transform.rotate(
                  angle: 6.5 * (3.1415926535 / 180),
                  child: Image.asset(
                    Images.logo,
                    height: height(150),
                  ),
                ),
              ),
              SizedBox(
                height: height(30),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: height(470),
                  width: width(320),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white30),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
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
                          SettingWidget(
                            name: 'المصادر ',
                            function: () {
                              context.pushNamed(AboutTheApp.name);
                            },
                          ),
                          SizedBox(
                            height: height(20),
                          ),
                          SettingWidget(
                            name: ' المفضلة',
                            function: () {
                              context.pushNamed(FavouriteScreen.name);
                            },
                          ),
                          SizedBox(
                            height: height(20),
                          ),


                          SettingWidget(
                            name: 'تغيير المقرر ',
                            function: () {
                              _saveAndNavigate(
                                  context, "3", ChooseSubjectScreen.name);
                            },
                          ),
                          SizedBox(
                            height: height(20),
                          ),


                        ],
                      ),
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
