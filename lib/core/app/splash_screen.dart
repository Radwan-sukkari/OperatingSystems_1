import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/choose_subject.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/core/app/nav_bar2.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/about_subject.dart';

import '../../resources/resources.dart';

class SplashScreen extends StatefulWidget {
  static const String name = 'splash_screen';
  static const String path = '/splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _navigateBasedOnRole();
  }

  Future<void> _navigateBasedOnRole() async {
    await Future.delayed(const Duration(milliseconds: 3800));

    String? role = await storage.read(key: "role");

    if (role == "1") {
      context.goNamed(NavBar.name);
    } else if (role == "2") {
      context.pushNamed(NavBar2.name);
    } else {
      context.goNamed(ChooseSubjectScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height(250),
                  ),
                  AboutSubject(child: Image.asset(Images.logo3)),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "تمت برمجة وتصميم التطبيق بواسطة الطالب رضوان سكري",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    )
                        // Animate from right to left
                        .animate()
                        .slide(
                          begin: const Offset(1.0, 0), // from right
                          end: Offset.zero,
                          duration: 600.ms,
                          curve: Curves.easeOut,
                        )
                        .fadeIn(duration: 600.ms),
                  )
                ],
              ))),
    );
  }
}
