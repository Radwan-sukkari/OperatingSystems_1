import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:operating_systems/features/quiz/presentation/pages/choose_quiz_type.dart';
import 'package:operating_systems/features/quiz/presentation/pages/quiz_screen.dart';
import 'package:operating_systems/features/study/presentation/pages/home_page.dart';
import 'package:operating_systems/features/study/presentation/pages/study_section/study_section_study_screen.dart';
import 'package:operating_systems/features/study/presentation/pages/table_screen.dart';


// Define your different screens here

enum _SelectedTab { HomePage, FavouriteScreen, PhotoSelector, AllUser }

class NavBar extends StatefulWidget {
  static const String name = 'nav_bar';
  static const String path = '/nav_bar';
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _selectedTab = _SelectedTab.HomePage;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  Widget _getSelectedTabWidget() {
    switch (_selectedTab) {
      case _SelectedTab.HomePage:
        return HomePageScreen(); // Replace with your actual home content widget
      case _SelectedTab.FavouriteScreen:
        return StudySectionStudyScreen(); // Replace with your Favourite screen widget
      case _SelectedTab.PhotoSelector:
        return HomePageScreen(); // Replace with your Add Post screen widget
      case _SelectedTab.AllUser:

        return ChooseQuizTypeScreen(); // Replace with your Profile screen widget
      default:
        return HomePageScreen(); // Fallback to home content
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _getSelectedTabWidget(), // Dynamically display the selected widget
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.black,
              unselectedColor:  Colors.black,
            ),
            CrystalNavigationBarItem(
              icon: IconlyLight.bookmark,
              unselectedIcon: IconlyLight.bookmark,
              selectedColor: Colors.black,
              unselectedColor:  Colors.black,

            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.plus,
              unselectedIcon: IconlyLight.plus,
              selectedColor: Colors.black,
              unselectedColor:  Colors.black,

            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.chat,
              unselectedIcon: IconlyLight.chat,
              selectedColor: Colors.black,
                           unselectedColor:  Colors.black,

            ),

          ],
          backgroundColor: Colors.white70,  // Set a different color for the navigation bar

        ),
      ),
    );
  }
}
