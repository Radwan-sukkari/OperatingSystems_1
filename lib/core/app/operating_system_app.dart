import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:operating_systems/core/app/app_l10n.dart';
import 'package:operating_systems/core/app/role_local_data_source.dart';
import 'package:operating_systems/core/app/router.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
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
              textTheme: appTheme.textTheme.apply(fontFamily: "Cairo-Regular")),
          builder: (context, child) => child!,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale("ar"),
          localizationsDelegates: AppLocalizations.localizationDelegates));

  static Future<void> hive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(QuestionAdapter());
    Hive.registerAdapter(AnswerAdapter());
    final questionBox = await Hive.openBox<Question>('favBox');
    registerHiveBox(questionBox);
  }

}
