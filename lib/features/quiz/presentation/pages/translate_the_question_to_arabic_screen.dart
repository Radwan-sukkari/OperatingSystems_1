import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/presentation/manager/answer_selected_bloc.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/first_layer.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/second_layer.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/third_layer.dart';

class TranslateQuestionTArabicScreen extends StatelessWidget {
  static const String name = 'translate_to_arabic_screen';
  static const String path = '/translate_to_arabic_screen';

  final Question questions;
  final String chapterArabic;
  final int questionNumberInTheChapter;
  final int questionIReceived;

  const TranslateQuestionTArabicScreen({super.key,
    required this.questions,
    required this.chapterArabic,
    required this.questionNumberInTheChapter,
    required this.questionIReceived});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleBloc(),
      child: Scaffold(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surfaceTint,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: width(20), left: width(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        FirstLayer(
                          question: questions,
                          chapterArabic: chapterArabic,
                          isArabic: true,
                          questionNumberInTheChapter: questionNumberInTheChapter,
                          questionIReceived: questionIReceived,
                          onNextQuestion: () {}, onPreviousQuestion: () {  },
                        ),
                        SecondLayer(
                          chapter: chapterArabic,
                          questionNumberInTheChapter: questionNumberInTheChapter,
                          questionIReceived: questionIReceived,
                        ),
                        ThirdLayer(),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
