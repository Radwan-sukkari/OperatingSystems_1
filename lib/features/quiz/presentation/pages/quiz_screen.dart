import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/first_layer.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/second_layer.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/third_layer.dart';

class QuizScreen extends StatelessWidget {
  final List<Question> questions;
  static const String name = 'quiz_screen';
  static const String path = '/quiz_screen';

  const QuizScreen({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: height(75), right: width(20), left: width(20)),
            child: Column(
              children: [
                SizedBox(
                  height: height(800),
                  child: PageView.builder(
                      itemCount: questions.length,
                      itemBuilder: (context, builder) {
                        return Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            FirstLayer(),
                            SecondLayer(),
                            ThirdLayer(),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
