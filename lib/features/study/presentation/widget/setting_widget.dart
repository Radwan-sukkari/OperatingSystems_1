import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:operating_systems/core/app/size.dart';

class SettingWidget extends StatelessWidget {
  final String name;
  final VoidCallback function;

  const SettingWidget({super.key, required this.name, required this.function});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          children: [
            Icon(
              HugeIcons.strokeRoundedCube,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: width(20),
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            IconButton(
                onPressed: function,
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ))
          ],
        ),
        SizedBox(
          height: height(12),
        ),
        Container(
          height: height(1),
          width: width(230),
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
