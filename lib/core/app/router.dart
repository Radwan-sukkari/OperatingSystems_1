import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/features/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/quiz/presentation/pages/quiz_screen.dart';
import 'package:operating_systems/features/quiz/presentation/pages/translate_the_question_to_arabic_screen.dart';
import 'package:operating_systems/features/study/presentation/pages/table_screen.dart';

import '../../features/quiz/data/model/quiz_model.dart';

final GoRouter router = GoRouter(initialLocation: NavBar.path, routes: [
  GoRoute(
    path: NavBar.path,
    name: NavBar.name,
    builder: (context, state) => NavBar(),
  ),
  GoRoute(
    path: OsiChapterGridScreen.path,
    name: OsiChapterGridScreen.name,
    builder: (context, state) => OsiChapterGridScreen(),
  ),
  GoRoute(
    path: TableScreen.path,
    name: TableScreen.name,
    builder: (context, state) => TableScreen(),
  ),
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
