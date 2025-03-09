import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/features/quiz/presentation/pages/quiz_screen.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/section_widget.dart';

class OsiChapterGridScreen extends StatelessWidget {
  static const String name = 'osi_chapter_grid_screen';
  static const String path = '/osi_chapter_grid_screen';

  const OsiChapterGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: SafeArea(
        child: SectionWidget(
          widget: Expanded(
            child: AnimationLimiter(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemCount: 12, // عدد الأزرار
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: 2,
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: SecondButton(
                          name: ' chapter ${index + 1}',
                          function: () {
                            context.pushNamed(QuizScreen.name);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ), name: 'اختر الفصل',
        ),
      ),
    );
  }
}
