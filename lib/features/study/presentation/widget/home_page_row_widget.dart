import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/quiz/presentation/pages/true_false_chapter_grid.dart';
import 'package:operating_systems/features/study/presentation/widget/container_row_card.dart';
import 'package:operating_systems/resources/resources.dart';

class HomePageRowWidget extends StatelessWidget {
  final bool isFirstRow;

  const HomePageRowWidget({super.key, required this.isFirstRow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFirstRow == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isFirstRow == true
            ? ContainerRowCard(
                firstText: 'الموقع osi',
                secondText: 'اسئلة ',
                thirdText: 'كويز  ',
                firstOnTap: () {
                  context
                      .pushNamed(OsiChapterGridScreen.name, queryParameters: {
                    "isStudy": "isStudy",
                  });
                },
                secondOnTap: () {
                  context
                      .pushNamed(OsiChapterGridScreen.name, queryParameters: {
                    "isStudy": "isNotStudy",
                  });
                },
              )
            : Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Images.boy10,
                  height: height(160),
                  width: width(145),
                ),
              ),
        SizedBox(
          width: width(30),
        ),
        isFirstRow == true
            ? Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  Images.boy9,
                  height: height(160),
                  width: width(145),
                ),
              )
            : ContainerRowCard(
                firstText: "الصح والخطأ",
                secondText: 'اسئلة ',
                thirdText: 'كويز ',
                firstOnTap: () {
                  context.pushNamed(TrueFalseChapterGridScreen.name,
                      queryParameters: {
                        "isStudy": "isStudy",
                      });
                },
                secondOnTap: () {
                  context.pushNamed(TrueFalseChapterGridScreen.name,
                      queryParameters: {
                        "isStudy": "isNotStudy",
                      });
                },
              )
      ],
    );
  }
}
