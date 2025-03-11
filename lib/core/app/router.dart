import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/features/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/quiz/presentation/pages/quiz_screen.dart';
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
      path: QuizScreen.path,
      name: QuizScreen.name,
      builder: (context, state) {
        final questions = state.extra as List<Question>;

        return QuizScreen(
          questions: questions,
        );
      }),
]);
