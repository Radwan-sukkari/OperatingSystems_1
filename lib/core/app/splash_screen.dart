import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/choose_subject.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_2/quiz/second_home_page_screen.dart';

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
    await Future.delayed(const Duration(seconds: 2)); // محاكاة التحميل

    String? role = await storage.read(key: "role"); // قراءة الدور من التخزين

    if (role == "1") {
      context.goNamed(NavBar.name);
    } else if (role == "2") {
      context.pushNamed(SecondHomePageScreen.name);
    } else {
      context.goNamed(ChooseSubjectScreen.name);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(Images.splashScreen),
        )
      ),
    );
  }
}
