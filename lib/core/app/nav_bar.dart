import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/home_page.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/study_section_study_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../features/operating_system_1/quiz/presentation/pages/choose_quiz_type.dart';
import '../../features/operating_system_1/quiz/presentation/pages/random_quiz.dart';
import '../../features/operating_system_1/study/presentation/pages/settings_screen/settings_screen.dart';

enum _SelectedTab {
  homePage,
  studySection,
  randomQuiz,
  chooseQuizType,
  setting
}

class NavBar extends StatefulWidget {
  static const String name = 'nav_bar';
  static const String path = '/nav_bar';

  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _selectedTab = _SelectedTab.homePage;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  Widget _getSelectedTabWidget() {
    switch (_selectedTab) {
      case _SelectedTab.homePage:
        return HomePageScreen();
      case _SelectedTab.studySection:
        return StudySectionStudyScreen();
      case _SelectedTab.randomQuiz:
        return RandomQuiz(isOperatingSystem1: "1",);
      case _SelectedTab.chooseQuizType:
        return ChooseQuizTypeScreen(subjectType: '1',);
      case _SelectedTab.setting:
        return SettingsScreen();
      default:
        return HomePageScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      extendBody: true,
      body: _getSelectedTabWidget(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).primaryColor,
            ),
            CrystalNavigationBarItem(
              icon: PhosphorIcons.books(PhosphorIconsStyle.bold),
              unselectedIcon: PhosphorIcons.books(),
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).primaryColor,
            ),
            CrystalNavigationBarItem(
              icon: CupertinoIcons.question_circle_fill,
              unselectedIcon: CupertinoIcons.question_circle,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).primaryColor,
            ),
            CrystalNavigationBarItem(
              icon: PhosphorIcons.exam(PhosphorIconsStyle.bold),
              unselectedIcon: PhosphorIcons.exam(),
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).primaryColor,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.setting,
              unselectedIcon: CupertinoIcons.gear,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).primaryColor,
            ),
          ],
          backgroundColor:
              Colors.white70, // Set a different color for the navigation bar
        ),
      ),
    );
  }
}
