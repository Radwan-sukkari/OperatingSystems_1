import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/core/app/nav_bar2.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/second_home_page_screen.dart';
import 'package:operating_systems/resources/resources.dart';

class ChooseSubjectScreen extends StatelessWidget {
  static const String name = 'choose_subject_screen';
  static const String path = '/choose_subject_screen';

  const ChooseSubjectScreen({super.key});

  Future<void> _saveAndNavigate(
      BuildContext context, String role, String route) async {
    const storage = FlutterSecureStorage();

    await storage.write(key: "role", value: role);
    context.goNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(15)),
            child: ColumnAnimations(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                duration: 400,
                curve: Curves.easeIn,
                columnContent: [
                  Image.asset(Images.boy14),
                  SizedBox(height: height(20)),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "قم باختيار المقرر الذي ترغب بدراسته",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: height(30)),
                  GestureDetector(
                    onTap: () => _saveAndNavigate(context, "1", NavBar.name),
                    child: Container(
                      height: height(42),
                      width: width(300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "نظم تشغيل 1",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height(20)),
                  GestureDetector(
                    onTap: () => _saveAndNavigate(context, "2", NavBar2.name),
                    child: Container(
                      height: height(42),
                      width: width(300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "نظم تشغيل 2",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
                verticalOffset: 0,
                horizontalOffset: 300)),
      ),
    );
  }
}
