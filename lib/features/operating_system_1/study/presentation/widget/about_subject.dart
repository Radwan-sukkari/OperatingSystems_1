import 'package:flutter/material.dart';

class AboutSubject extends StatefulWidget {
  final Widget child;
  const AboutSubject({Key? key, required this.child}) : super(key: key);

  @override
  _AboutSubjectState createState() => _AboutSubjectState();
}

class _AboutSubjectState extends State<AboutSubject>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
      if (!_controller.isAnimating) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child, // استخدم child بدلاً من widget مباشرة
    );
  }
}


class SmallButton extends StatelessWidget {
  final String text;
  final Size size;
  final VoidCallback onPressed;

  const SmallButton({
    Key? key,
    required this.text,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        fixedSize: size,
      ),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
    );
  }
}
