import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/flush_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/manager/answer_selected_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/translate_the_question_to_arabic_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/answers_list.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/question_widget.dart';


class FirstLayer extends StatelessWidget {
  final Question question;
  final String chapterArabic;
  final bool isArabic;
  final int questionNumberInTheChapter;
  final int questionIReceived;
  final VoidCallback onNextQuestion;
  final VoidCallback onPreviousQuestion;

  const FirstLayer({
    super.key,
    required this.question,
    required this.chapterArabic,
    required this.isArabic,
    required this.questionNumberInTheChapter,
    required this.questionIReceived,
    required this.onNextQuestion,
    required this.onPreviousQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleBloc, ToggleState>(
      builder: (context, state) {
        return Container(
          width: width(350),
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height(40), horizontal: width(20)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuestionWidget(
                    question:
                        isArabic ? question.questionAr : question.questionEn,
                    isArabic: isArabic,
                  ),
                  SizedBox(height: height(30)),
                  AnswersList(
                    answers: question.answers,
                    isArabic: isArabic,
                  ),
                  if (!isArabic) SizedBox(height: height(30)),
                  if (!isArabic)
                    GestureDetector(
                      onTap: () {
                        context
                            .read<ToggleBloc>()
                            .add(ShowAnswer(question.answers));
                        question.description != null &&
                                question.description!.isNotEmpty
                            ? showFlushBar(context, question.description ?? "")
                            : SizedBox.shrink();
                      },
                      child: MainButton(
                        name: "اظهار الجواب",
                      ),
                    ),
                  SizedBox(height: height(8)),
                  if (!isArabic)
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(TranslateQuestionTArabicScreen.name,
                            extra: question,
                            queryParameters: {
                              "chapterArabic": chapterArabic,
                              "questionNumberInTheChapter":
                                  questionNumberInTheChapter.toString(),
                              "questionIReceived": questionIReceived.toString()
                            });
                      },
                      child: MainButton(name: "اظهار الترجمة"),
                    ),
                  if (state
                      is AnswerValidated) // Show "Next Question" and "Previous Question" buttons after answer is validated
                    Column(
                      children: [
                        SizedBox(height: height(10)),
                        GestureDetector(
                          onTap: onNextQuestion,
                          child: MainButton(
                            name: " السؤال التالي",
                          ),
                        ),
                        SizedBox(height: height(10)),
                        GestureDetector(
                          onTap: onPreviousQuestion,
                          child: MainButton(
                            name: "السؤال السايق ",
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: height(8)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
