import "package:flutter/material.dart";

import "font_size.dart";

class AppTheme {
  const AppTheme();

  static ColorScheme lightScheme() => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff205781),
        surfaceTint: Color(0xffFFF0BD),
        onPrimary: Color(0xfffefefe),
        primaryContainer: Color(0xffdac6e0),
        onPrimaryContainer: Color(0xffCC6F6F),
        secondary: Color(0xff272727),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffCC6F6F),
        onSecondaryContainer: Color(0xffB25939),
        tertiary: Color(0xffCD8C74),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffA5A5A5),
        onTertiaryContainer: Color(0xff666666),
        error: Color(0xffC81E1E),
        onError: Color(0xfffefefe),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xffe02424),
        surface: Color(0xffFEFDFD),
        onSurface: Color(0xff4B465C),
        onSurfaceVariant: Color(0xff4B465C),
        //me
        outline: Color(0xffC8C8C8),
        outlineVariant: Color(0xffc3c6d2),
        shadow: Color(0xff1a1a1a),
        scrim: Color(0xff1a1a1a),
        inverseSurface: Color(0xff4B465C),
        //نوع الاطار
        inversePrimary: Color(0xffdac6e0),
        primaryFixed: Color(0xffede3f0),
        onPrimaryFixed: Color(0xff301936),
        primaryFixedDim: Color(0xffbcbcbc),
        onPrimaryFixedVariant: Color(0xff7b3f8c),
        secondaryFixed: Color(0xffd6e3ff),
        onSecondaryFixed: Color(0xffFF9B26),
        //rating
        secondaryFixedDim: Color(0xffcbe9ca),
        onSecondaryFixedVariant: Color(0xffc9c9c9),
        tertiaryFixed: Color(0xffEF5A6F),
        onTertiaryFixed: Color(0xffF09001),
        //rating
        tertiaryFixedDim: Color(0xff6cc1bd),
        onTertiaryFixedVariant: Color(0xff67326d),
        surfaceDim: Color(0xffdad9df),
        surfaceBright: Color.fromARGB(255, 106, 88, 170),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff3f3f9),
        surfaceContainer: Color(0xffeeedf3),
        surfaceContainerHigh: Color(0xffe8e7ed),
        surfaceContainerHighest: Color(0xffe2e2e8),
      );

  ThemeData light() => theme();

  ThemeData theme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: lightScheme(),
        textTheme: TextTheme(
          titleSmall: TextStyle(
              fontSize: FontSize.titleSmall, color: lightScheme().onSurface),
          displayLarge: TextStyle(
              fontSize: FontSize.displayLarge,
              fontWeight: FontWeight.bold,
              color: lightScheme().shadow),
          displaySmall: TextStyle(
              fontSize: FontSize.displaySmall, color: lightScheme().onTertiaryContainer,fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              fontSize: FontSize.headlineSmall, color: lightScheme().shadow),
          titleLarge: TextStyle(
              fontSize: FontSize.titleLarge, color: lightScheme().outline),
          bodyMedium: TextStyle(
            fontSize: FontSize.bodyMedium,
            color: lightScheme().shadow,
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
              fontSize: FontSize.labelMedium,
              color: lightScheme().tertiaryContainer,
            fontWeight: FontWeight.bold,

          ),
          labelLarge: TextStyle(
              fontSize: FontSize.labelLarge,
              color: lightScheme().secondary,
            ),
          bodyLarge: TextStyle(
              fontSize: FontSize.bodyLarge, color: lightScheme().secondary),
          labelSmall: TextStyle(
              fontSize: FontSize.labelSmall, color: lightScheme().shadow),
          bodySmall: TextStyle(
              fontSize: FontSize.bodySmall, color: lightScheme().shadow),
          titleMedium: TextStyle(
              fontSize: FontSize.titleMedium, color: lightScheme().onSurfaceVariant),
        ),
        appBarTheme: AppBarTheme(
          toolbarHeight: 70,
          titleTextStyle: TextStyle(
              fontSize: FontSize.titleLarge, color: lightScheme().shadow),
          color: lightScheme().surface,
          iconTheme: IconThemeData(color: lightScheme().shadow, size: 32),
        ),
        iconTheme: const IconThemeData(size: 16),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightScheme().primary,
          selectedItemColor: lightScheme().primaryContainer,
          unselectedItemColor: lightScheme().onErrorContainer,
        ),
        scaffoldBackgroundColor: lightScheme().surface,
        canvasColor: lightScheme().surface,
      );
}
