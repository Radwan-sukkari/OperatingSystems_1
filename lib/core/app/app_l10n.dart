import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class L10n {
  static final all = [
    const Locale('ar'),
  ];
}

class AppLocalizations {
  static List<Locale> get supportedLocales => L10n.all;

  static List<LocalizationsDelegate> get localizationDelegates => const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
