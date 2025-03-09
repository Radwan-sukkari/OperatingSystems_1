import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/features/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/quiz/presentation/pages/quiz_screen.dart';
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
    path: QuizScreen.path,
    name: QuizScreen.name,
    builder: (context, state) => QuizScreen(),
  ),
]);
