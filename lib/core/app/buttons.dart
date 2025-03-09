import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';

class MainButton extends StatelessWidget {
  final String name;

  const MainButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(34),
      width: width(280),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
          child: Text(
        name,
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}

class SecondButton extends StatelessWidget {
  final String name;
  final VoidCallback function;

  const SecondButton({super.key, required this.name, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: height(150),
        width: width(150),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.white),
        )),
      ),
    );
  }
}
