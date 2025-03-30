import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/choose_quiz_type.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/random_quiz.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/home_page.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/settings_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/second_home_page_screen.dart';
import 'package:operating_systems/features/operating_system_2/study/presentation/pages/choose_section_to_study2_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum _SelectedTab {
  homePage,
  studySection,
  randomQuiz,
  chooseQuizType,
  setting
}

class NavBar2 extends StatefulWidget {
  static const String name = 'nav_bar2';
  static const String path = '/nav_bar2';

  const NavBar2({super.key});

  @override
  State<NavBar2> createState() => _NavBar2State();
}

class _NavBar2State extends State<NavBar2> {
  var _selectedTab = _SelectedTab.homePage;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  Widget _getSelectedTabWidget() {
    switch (_selectedTab) {
      case _SelectedTab.homePage:
        return SecondHomePageScreen();
      case _SelectedTab.studySection:
        return ChooseSectionToStudy2Screen();
      case _SelectedTab.randomQuiz:
        return RandomQuiz(isOperatingSystem1: "2",);
      case _SelectedTab.chooseQuizType:
        return ChooseQuizTypeScreen(subjectType: '2',);
      case _SelectedTab.setting:
        return SettingsScreen(subjectType: '2',);
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
        padding: const EdgeInsets.only(bottom: 5),
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
