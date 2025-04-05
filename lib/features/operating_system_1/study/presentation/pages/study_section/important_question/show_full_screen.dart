import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:photo_view/photo_view.dart';

class ShowFullScreen extends StatelessWidget {
  static const String name = 'show_full_screen';
  static const String path = '/show_full_screen';
  final String question;
  final String imagePath;
  const ShowFullScreen({super.key, required this.question, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return  PhotoView(
          imageProvider: AssetImage(imagePath),
          minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 2,
          initialScale: PhotoViewComputedScale.contained,
          heroAttributes: PhotoViewHeroAttributes(tag: imagePath),
        );

  }
}
