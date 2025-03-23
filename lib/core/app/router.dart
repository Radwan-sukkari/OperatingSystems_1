import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/choose_subject.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/core/app/nav_bar2.dart';
import 'package:operating_systems/core/app/splash_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/quiz_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/random_quiz.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/translate_the_question_to_arabic_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/true_false_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/algorithms_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/about_the_app.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/about_the_subject.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/settings_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/choose_algorithm_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/comparisons_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/osi_question_study/choose_comparisons_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/osi_question_study/osi_question_study_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/study_section_study_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/second_home_page_screen.dart';

final GoRouter router = GoRouter(initialLocation: SplashScreen.path, routes: [
  GoRoute(
    path: NavBar.path,
    name: NavBar.name,
    builder: (context, state) => NavBar(),
  ),
  GoRoute(
    path: AboutTheSubject.path,
    name: AboutTheSubject.name,
    builder: (context, state) => AboutTheSubject(),
  ),
  GoRoute(
    path: NavBar2.path,
    name: NavBar2.name,
    builder: (context, state) => NavBar2(),
  ),
  GoRoute(
    path: SplashScreen.path,
    name: SplashScreen.name,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: ChooseSubjectScreen.path,
    name: ChooseSubjectScreen.name,
    builder: (context, state) => ChooseSubjectScreen(),
  ),
  GoRoute(
    path: SecondHomePageScreen.path,
    name: SecondHomePageScreen.name,
    builder: (context, state) => SecondHomePageScreen(),
  ),
  GoRoute(
    path: AboutTheApp.path,
    name: AboutTheApp.name,
    builder: (context, state) => AboutTheApp(),
  ),
  GoRoute(
    path: SettingsScreen.path,
    name: SettingsScreen.name,
    builder: (context, state) => SettingsScreen(),
  ),
  GoRoute(
    path: ChooseAlgorithmsScreen.path,
    name: ChooseAlgorithmsScreen.name,
    builder: (context, state) => ChooseAlgorithmsScreen(),
  ),
  GoRoute(
      path: ComparisonsScreen.path,
      name: ComparisonsScreen.name,
      builder: (context, state) {
        final Comparisons = state.extra as List<Comparison>;

        return ComparisonsScreen(
          comparisons: Comparisons,
        );
      }),
  GoRoute(
    path: ChooseComparisonsScreen.path,
    name: ChooseComparisonsScreen.name,
    builder: (context, state) => ChooseComparisonsScreen(),
  ),
  GoRoute(
      path: RandomQuiz.path,
      name: RandomQuiz.name,
      builder: (context, state) {
        final String isOperatingSystem1 =
            state.uri.queryParameters['isOperatingSystem1']!;

        return RandomQuiz(
          isOperatingSystem1: isOperatingSystem1,
        );
      }),
  GoRoute(
      path: OsiChapterGridScreen.path,
      name: OsiChapterGridScreen.name,
      builder: (context, state) {
        final String isStudy = state.uri.queryParameters['isStudy']!;

        return OsiChapterGridScreen(isStudy: isStudy);
      }),
  GoRoute(
      path: TrueFalseChapterGridScreen.path,
      name: TrueFalseChapterGridScreen.name,
      builder: (context, state) {
        final String isStudy = state.uri.queryParameters['isStudy']!;

        return TrueFalseChapterGridScreen(isStudy: isStudy);
      }),
  GoRoute(
      path: AlgorithmsScreens.path,
      name: AlgorithmsScreens.name,
      builder: (context, state) {
        final algorithm = state.extra as Algorithm;

        return AlgorithmsScreens(algorithm: algorithm);
      }),
  GoRoute(
    path: StudySectionStudyScreen.path,
    name: StudySectionStudyScreen.name,
    builder: (context, state) => StudySectionStudyScreen(),
  ),
  GoRoute(
      path: OsiQuestionStudyScreen.path,
      name: OsiQuestionStudyScreen.name,
      builder: (context, state) {
        final questions = state.extra as List<Question>;
        final String chapterEnglish =
            state.uri.queryParameters['chapterEnglish']!;
        final String chapterArabic =
            state.uri.queryParameters['chapterArabic']!;
        return OsiQuestionStudyScreen(
          chapterArabic: chapterArabic,
          questions: questions,
          chapterEnglish: chapterEnglish,
        );
      }),
  GoRoute(
    path: TranslateQuestionTArabicScreen.path,
    name: TranslateQuestionTArabicScreen.name,
    builder: (context, state) {
      final questions = state.extra as Question;

      final String chapterArabic = state.uri.queryParameters['chapterArabic']!;

      final int questionNumberInTheChapter =
          int.parse(state.uri.queryParameters['questionNumberInTheChapter']!);

      final int questionIReceived =
          int.parse(state.uri.queryParameters['questionIReceived']!);

      return TranslateQuestionTArabicScreen(
        questions: questions,
        chapterArabic: chapterArabic,
        questionNumberInTheChapter: questionNumberInTheChapter,
        questionIReceived: questionIReceived,
      );
    },
  ),
  GoRoute(
      path: QuizScreen.path,
      name: QuizScreen.name,
      builder: (context, state) {
        final questions = state.extra as List<Question>;
        final String chapterEnglish =
            state.uri.queryParameters['chapterEnglish']!;
        final String chapterArabic =
            state.uri.queryParameters['chapterArabic']!;
        return QuizScreen(
          questions: questions,
          chapterEnglish: chapterEnglish,
          chapterArabic: chapterArabic,
        );
      }),
]);
