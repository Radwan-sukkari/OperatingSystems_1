import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Size get preferredSize => Size.fromHeight(
      isFavourite ? kToolbarHeight + 48 : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      automaticallyImplyLeading: false, // Prevent default back button
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.25),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 22,
        ),
      ),
      leading: isBack
          ? IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Theme.of(context).colorScheme.primary,
        ),
      )
          : null,
      actions: [
        // Replace this with any custom action you want
        Padding(
          padding: EdgeInsets.only(right: width(10)),
          child: GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(
                  "https://www.instagram.com/operating_system1_2?igsh=MXBlc3NlaXU3ajhjOQ=="));
            },
            child: Image.asset(
              Images.logo3,
              height: height(60),
              width: width(60),
            ),
          ),
        ),
      ],
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
