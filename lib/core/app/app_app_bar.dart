import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isFavourite;
final bool isBack;
  const AppAppBar({
    super.key,
    required this.title,
    this.isFavourite = false,
    this.isBack=false,
  });

  @override
  Size get preferredSize => Size.fromHeight(
      isFavourite
          ? kToolbarHeight + 48 // Height with TabBar
          : kToolbarHeight // Standard height
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 22,
        ),
      ),
       actions: [
        if (isBack)
    IconButton(
      onPressed: () => context.pop(),
      icon: Padding(
        padding: EdgeInsets.only(right: width(5)),
        child: Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    ),
    ],

    leading: Image.asset(Images.logo3),
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      bottom: isFavourite
          ? const TabBar(
        tabs: [
          Tab(text: 'Multi Choice'),
          Tab(text: 'True/False'),
        ],
      )
          : null,
    );
  }
}