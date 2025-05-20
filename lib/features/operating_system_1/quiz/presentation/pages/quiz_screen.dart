import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/flush_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/manager/answer_selected_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/previous_and_next_question.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/first_layer/first_layer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/second_layer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/third_layer.dart';

class QuizScreen extends StatefulWidget {
  static const String name = 'quiz_screen';
  static const String path = '/quiz_screen';
  final List<Question> questions;
  final String chapterEnglish;
  final String chapterArabic;
  final String appBarTitle;

  const QuizScreen({
    super.key,
    required this.questions,
    required this.chapterEnglish,
    required this.chapterArabic,
    required this.appBarTitle,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;
  bool addCounter = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _nextQuestion(BuildContext context) {
    if (_currentPage < widget.questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        addCounter = true;
        _currentPage++;
      });

      context.read<ToggleBloc>().add(ResetState());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No more questions!"),
          duration: Duration(seconds: 2),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No more questions!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _previousQuestion(BuildContext context) {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        addCounter = false;
        _currentPage--;
      });

      context.read<ToggleBloc>().add(ResetState());
    } else {
      showFlushBar(context, "هذا اول سؤال");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ToggleBloc>(),
      child: BlocListener<ToggleBloc, ToggleState>(
        listener: (context, state) {
          if (state is AnswerValidated) {
            if (state.isCorrect && addCounter == true) {
              setState(() {
                correctAnswers++;
              });
            } else if (state.isCorrect == false && addCounter == true) {
              setState(() {
                incorrectAnswers++;
              });
            }
            if (_currentPage == widget.questions.length - 1) {
              Future.delayed(const Duration(milliseconds: 500), () {
                _showResultsDialog(context);
              });
            }
          }
        },
        child: Scaffold(
          appBar: AppAppBar(title: widget.appBarTitle, isBack: true),
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                right: width(20),
                left: width(20),
                top: height(30),
                bottom: height(10),
              ),
              child: Column(
                children: [
                  Text(
                      " correct answer $correctAnswers  incorrect answer $incorrectAnswers"),
                  BlocBuilder<ToggleBloc, ToggleState>(
                    builder: (context, state) {
                      return PreviousAndNextQuestion(
                        nextQuestion: () {
                          _nextQuestion(context);
                        },
                        previousQuestion: () {
                          _previousQuestion(context);
                        },
                      );
                    },
                  ),
                  Flexible(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemCount: widget.questions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: height(75)),
                          child: Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                FirstLayer(
                                  question: widget.questions[index],
                                  chapterArabic:
                                      widget.questions[index].chapterAr,
                                  isArabic: false,
                                  questionNumberInTheChapter:
                                      widget.questions.length,
                                  questionIReceived: index + 1,
                                  onNextQuestion: () => _nextQuestion(context),
                                  onPreviousQuestion: () =>
                                      _previousQuestion(context),
                                ),
                                SecondLayer(
                                  chapter: widget.questions[index].chapterEn,
                                  questionNumberInTheChapter:
                                      widget.questions.length,
                                  questionIReceived: index + 1,
                                ),
                                const ThirdLayer(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showResultsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('نتيجة الاختبار'),
          content: Text(
            'عدد الإجابات الصحيحة: $correctAnswers\nعدد الإجابات الخاطئة: $incorrectAnswers',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // يرجع  للشاشة السابقة
              },
              child: const Text('حسنًا'),
            ),
          ],
        );
      },
    );
  }
}
