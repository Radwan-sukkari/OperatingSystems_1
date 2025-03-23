import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:operating_systems/core/app/app_l10n.dart';
import 'package:operating_systems/core/app/router.dart';
import '../theme/app_theme.dart';

class OperatingSystemApp extends StatelessWidget {
  OperatingSystemApp({super.key});

  final appTheme = const AppTheme().light();

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(375, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: appTheme.copyWith(
              textTheme:
              appTheme.textTheme.apply(fontFamily: "Cairo-Regular")),
          builder: (context, child) => child!,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale("ar"),
          localizationsDelegates: AppLocalizations.localizationDelegates));
}
