import 'package:flutter/material.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesScreen extends StatelessWidget {
  static const String name = 'resources_screen';
  static const String path = '/resources_screen';

  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "المصادر",
        isBack: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ColumnAnimations(
            duration: 400,
            curve: Curves.easeIn,
            columnContent: [
              Text(
                " جميع الاجابات لجميع الاسئلة ليست جهد شخصي انما اخذت من  المقرر ومن ملخصات وتم وضعها في التطبيق وفي هذه القناة جميع المصادر التي تم الاعتماد عليها",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      height: 1.5,
                    ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: height(10),
              ),
              GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse("https://t.me/operating_system12"));
                  },
                  child: Text(
                    "https://t.me/operating_system12",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.shadow,
                        height: 1.5,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        decorationThickness: 1.5,
                        decorationColor: Theme.of(context).colorScheme.shadow),
                    textAlign: TextAlign.justify,
                  )),
            ],
            verticalOffset: 0,
            horizontalOffset: 200),
      ),
    );
  }
}
