import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:operating_systems/features/quiz/presentation/pages/choose_quiz_type.dart';
import 'package:operating_systems/features/quiz/presentation/pages/random_quiz.dart';
import 'package:operating_systems/features/study/presentation/pages/home_page.dart';
import 'package:operating_systems/features/study/presentation/pages/settings_screen/settings_screen.dart';
import 'package:operating_systems/features/study/presentation/pages/study_section/study_section_study_screen.dart';



enum _SelectedTab { homePage, studySection, randomQuiz, chooseQuizType ,setting}

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
        return RandomQuiz();
      case _SelectedTab.chooseQuizType:
        return ChooseQuizTypeScreen();
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
        padding: const EdgeInsets.only(bottom: 5),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(

              icon: IconlyBold.home,
              unselectedIcon: IconlyBold.home,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor:  Theme.of(context).primaryColor,
            ),
            CrystalNavigationBarItem(
              icon: FontAwesomeIcons.bookOpen,
              unselectedIcon: FontAwesomeIcons.bookOpen,
              selectedColor:Theme.of(context).primaryColor,
              unselectedColor:  Theme.of(context).primaryColor,

            ),
            CrystalNavigationBarItem(
              icon: FontAwesomeIcons.question,
              unselectedIcon: FontAwesomeIcons.question,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor:  Theme.of(context).primaryColor,

            ),
            CrystalNavigationBarItem(
              icon: FontAwesomeIcons.book,
              unselectedIcon: FontAwesomeIcons.book,
              selectedColor:Theme.of(context).primaryColor,
                           unselectedColor:  Theme.of(context).primaryColor,

            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.setting,
              unselectedIcon: IconlyBold.setting,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor:Theme.of(context).primaryColor,
            ),
          ],
          backgroundColor: Colors.white70,  // Set a different color for the navigation bar

        ),
      ),
    );
  }
}
