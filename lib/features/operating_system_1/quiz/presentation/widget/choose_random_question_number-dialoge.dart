import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/flush_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/core/bloc/bloc_state_data_builder.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_random_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/manager/quiz_feature/quiz_feature_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/quiz_screen.dart';

import 'package:operating_systems/resources/resources.dart';

class ChooseRandomQuestionNumberDialog extends StatelessWidget {
  ChooseRandomQuestionNumberDialog({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<QuizFeatureBloc>()..add(RandomQuizEvent()),
      child: BlocSelector<QuizFeatureBloc, QuizFeatureState,
          BlocStateData<RandomQuizModel>>(
        selector: (state) => state.randomQuizState,
        builder: (context, state) {
          return BlocStateDataBuilder(
            data: state,
            onSuccess: (state) => AlertDialog(
              backgroundColor: Colors.white.withOpacity(0.92),
              title: Column(
                children: [
                  Image.asset(Images.boy13),
                  Text(
                    "اختر عدد الأسئلة",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              content: TextField(
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "أدخل عدد الأسئلة",
                  hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("إلغاء"),
                ),
                GestureDetector(
                  onTap: () {
                    int requestedQuestions =
                        int.tryParse(textController.text) ?? 0;
                    if (requestedQuestions > 0 &&
                        requestedQuestions <= state!.randomQuiz.length) {
                      List<Question> shuffledQuestions =
                          List<Question>.from(state.randomQuiz);
                      shuffledQuestions.shuffle();
                      List<Question> selectedQuestions =
                          shuffledQuestions.take(requestedQuestions).toList();

                      context.pushNamed(
                        QuizScreen.name,
                        queryParameters: {
                          'chapterEnglish': "RandomChapter",
                          'chapterArabic': "RandomChapter"
                        },
                        extra: selectedQuestions,
                      );
                    } else {
                      showFlushBar(context,
                          "يرجى إدخال رقم  بين 1 و ${state!.randomQuiz.length}");
                    }
                  },
                  child: Container(
                    height: height(40),
                    width: width(80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        "تأكيد",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
