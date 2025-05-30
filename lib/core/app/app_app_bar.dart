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
    this.isBack = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(isFavourite
          ? kToolbarHeight + 48 // Height with TabBar
          : kToolbarHeight // Standard height
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(

      elevation: 2,
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.25),
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
              padding: EdgeInsets.only(left: width(10)),
              child: Icon(
                Icons.arrow_back_ios_new,
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
                Tab(text: 'اختر الاجابة '),
                Tab(text: 'خطا/صح'),
              ],
            )
          : null,
    );
  }
}
