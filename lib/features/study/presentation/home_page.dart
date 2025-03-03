import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  static const String name = 'home_page_screen';
  static const String path = '/home_page_screen';

  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "cairo fkjhjkl ",
              style: Theme.of(context).textTheme.headlineLarge,
            ))
          ],
        ));
  }
}
