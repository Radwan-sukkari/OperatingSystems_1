import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String name = 'settings_screen';
  static const String path = '/settings_screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,

      body: Column(
        children: [],
      ),
    );
  }
}
