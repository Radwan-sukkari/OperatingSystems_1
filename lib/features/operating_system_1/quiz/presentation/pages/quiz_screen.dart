import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  const QuizScreen({
    super.key,
    required this.questions,
    required this.chapterEnglish,
    required this.chapterArabic,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _pageController;
  int _currentPage = 0;

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
    }
  }

  void _previousQuestion(BuildContext context) {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
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
      child: Scaffold(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surfaceTint,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                right: width(20), left: width(20), top: height(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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

                /// 🔹 **أزرار التنقل بين الأسئلة**
              ],
            ),
          ),
        ),
      ),
    );
  }
}
