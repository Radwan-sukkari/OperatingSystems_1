import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/animations/colum_animations.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/third_layer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/important_question_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/important_question/show_full_screen.dart';

class ImportantQuestionCard extends StatelessWidget {
  final ImportantQuestion importantQuestion;

  const ImportantQuestionCard({super.key, required this.importantQuestion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: height(75),
        right: width(15),
        left: width(15),
        bottom: height(20)
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width(370),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  right: width(15),
                  left: width(15),
                  top: height(20),
                  bottom: height(20)),
              child: ColumnAnimations(
                duration: 200,
                curve: Curves.easeIn,
                columnContent: [
                  if (importantQuestion.question.isNotEmpty)
                    Text(
                      importantQuestion.question,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.shadow),
                    ),
                  SizedBox(
                    height: height(20),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      importantQuestion.questionEn,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.shadow),
                    ),
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Text("الجواب :",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.error)),
                  SizedBox(
                    height: height(10),
                  ),
                  if (importantQuestion.answer.isNotEmpty)
                    Text(importantQuestion.answer,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary)),
                  SizedBox(
                    height: height(20),
                  ),
                  if (importantQuestion.image.isNotEmpty)
                    Center(
                      child: GestureDetector(
                        onTap: () => context.pushNamed(ShowFullScreen.name,
                            queryParameters: {
                              "question": importantQuestion.question,
                              "imagePath": importantQuestion.image
                            }),
                        child: Hero(
                          tag: importantQuestion.image,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              importantQuestion.image,
                              height: height(100),
                              width: width(200),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: height(20),
                  ),
                  if (importantQuestion.image.isNotEmpty)
                    Text(
                      "يمكنك الضفط على الصورة وتكبيرها وتصغيرها بقدر ماتشاء",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).shadowColor,
                          ),
                    )
                ],
                verticalOffset: 0,
                horizontalOffset: 200,
              ),
            ),
          ),
          const ThirdLayer(),
        ],
      ),
    );
  }
}
