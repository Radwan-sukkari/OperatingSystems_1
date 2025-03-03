import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
final GoRouter router = GoRouter(initialLocation: NavBar.path, routes: [
  GoRoute(
    path: NavBar.path,
    name: NavBar.name,
    builder: (context, state) => NavBar(),
  ),
]);
