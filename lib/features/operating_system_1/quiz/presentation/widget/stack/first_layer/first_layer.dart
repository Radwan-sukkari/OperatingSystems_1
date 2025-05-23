import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/buttons.dart';
import 'package:operating_systems/core/app/favourite_widget.dart';
import 'package:operating_systems/core/app/flush_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/favourite/presentation/manager/favourite/favourite_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/manager/answer_selected_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/translate_the_question_to_arabic_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/answers_list.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/question_widget.dart';

import '../../../../../../../core/injection/injection.dart';

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
    return BlocProvider.value(
      value: getIt<FavouriteBloc>()..add(GetFavouriteEvent()),
      child: BlocBuilder<ToggleBloc, ToggleState>(
        builder: (context, state) {
          final isAnswerSelected = state is ToggleInitial && state.selectedIndex != null;
          final isAnswerValidated = state is AnswerValidated;
          return Container(
            width: width(350),
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height(10), horizontal: width(20)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FavouriteWidget(question: question),
                    SizedBox(
                      height: height(20),
                    ),
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
                          context.pushNamed(TranslateQuestionTArabicScreen.name,
                              extra: question,
                              queryParameters: {
                                "chapterArabic": chapterArabic,
                                "questionNumberInTheChapter":
                                questionNumberInTheChapter.toString(),
                                "questionIReceived":
                                questionIReceived.toString()
                              });
                        },
                        child: MainButton(name: "اظهار الترجمة"),
                      ),
                    SizedBox(height: height(8)),

                    if (!isArabic&& isAnswerSelected && !isAnswerValidated)
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ToggleBloc>()
                              .add(ShowAnswerEvent(question.answers));
                          question.description != null &&
                                  question.description!.isNotEmpty
                              ? showFlushBar(
                                  context, question.description ?? "")
                              : SizedBox.shrink();
                        },
                        child: MainButton(
                          name: "اظهار الجواب",
                        ),
                      ),

                    SizedBox(
                      height: height(10),
                    ),
                    if (state
                        is AnswerValidated) // Show "Next Question" and "Previous Question" buttons after answer is validated
                      Container(
                        margin: EdgeInsets.only(right: width(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width(137),
                              child: GestureDetector(
                                onTap: onPreviousQuestion,
                                child: MainButton(
                                  name: "السؤال السايق ",
                                ),
                              ),
                            ),
                            SizedBox(width: width(10)),
                            SizedBox(
                              width: width(137),
                              child: GestureDetector(
                                onTap: onNextQuestion,
                                child: MainButton(
                                  name: " السؤال التالي",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: height(8)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
