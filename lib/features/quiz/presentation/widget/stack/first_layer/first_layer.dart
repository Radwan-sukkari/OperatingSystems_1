import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/quiz/presentation/pages/translate_the_question_to_arabic_screen.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/answers_list.dart';
import 'package:operating_systems/features/quiz/presentation/widget/stack/first_layer/question_widget.dart';

class FirstLayer extends StatelessWidget {
  final Question question;
  final String chapterArabic;
  final bool isArabic;
  final int questionNumberInTheChapter;
  final int  questionIReceived;

  const FirstLayer(
      {super.key,
      required this.question,
      required this.chapterArabic,
      required this.isArabic, required this.questionNumberInTheChapter, required this.questionIReceived});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(350),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height(40)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuestionWidget(
                question: isArabic == false
                    ? question.questionEn
                    : question.questionAr,
                isArabic: isArabic,
              ),
              SizedBox(height: height(30)),
              AnswersList(
                answers: question.answers,
                isArabic: isArabic,
              ),
              isArabic == false
                  ? SizedBox(height: height(30))
                  : SizedBox.shrink(),
              isArabic == false
                  ? MainButton(name: "اظهار الاجابة")
                  : SizedBox.shrink(),
              SizedBox(height: height(8)),
              isArabic == false
                  ? GestureDetector(
                      onTap: () {
                        context.pushNamed(TranslateQuestionTArabicScreen.name,
                            extra: question,
                            queryParameters: {
                              "chapterArabic": chapterArabic,
                              "questionNumberInTheChapter":questionNumberInTheChapter.toString(),
                              "questionIReceived":questionIReceived.toString()
                            });
                      },
                      child: MainButton(name: "اظهار الترجمة"))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
