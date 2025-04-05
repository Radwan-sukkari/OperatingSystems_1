import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/flush_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/manager/identification_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/Identification_quiz_card.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/previous_and_next_question.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/definition_card2.dart';

class IdentificationQuizScreen extends StatefulWidget {
  final List<Definition> definitions;
  static const String name = 'definitions_quiz_screen';
  static const String path = '/definitions_quiz_screen';

  const IdentificationQuizScreen({super.key, required this.definitions});

  @override
  State<IdentificationQuizScreen> createState() =>
      _IdentificationQuizScreenState();
}

class _IdentificationQuizScreenState extends State<IdentificationQuizScreen> {
  TextEditingController controller = TextEditingController();
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _nextQuestion(BuildContext context) {
    if (_currentPage < widget.definitions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
        controller.clear();
      });
      // Reset show answer state when moving to next question
      context.read<ShowAnswerBloc>().add(ToggleShowAnswer());
    } else {
      showFlushBar(context, "لايوجد المزيد من التعاريف");
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
        controller.clear();
      });
      context.read<ShowAnswerBloc>().add(ToggleShowAnswer());
    } else {
      showFlushBar(context, "هذا اول سؤال");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ShowAnswerBloc>(),
      child: Scaffold(
        appBar: AppAppBar(title: "كويز التعاريف",isBack: true,),
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                right: width(15),
                left: width(15),
                top: height(30),
                bottom: height(20)),
            child: Column(
              children: [
                PreviousAndNextQuestion(
                  nextQuestion: () {
                    _nextQuestion(context);
                  },
                  previousQuestion: () {
                    _previousQuestion(context);
                  },
                ),
                SizedBox(height: height(15),),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height(400),
                          child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            itemCount: widget.definitions.length,
                            itemBuilder: (builder, index) {
                              return IdentificationQuizCard(
                                controller: controller,
                                title: widget.definitions[index].titleEn,
                                explain: widget.definitions[index].explain,
                                allQuestions: widget.definitions.length,
                                index: index,
                              );
                            },
                          ),
                        ),
                        BlocBuilder<ShowAnswerBloc, ShowAnswerState>(
                          builder: (context, state) {
                            if (state.isShowAnswer) {
                              return Column(
                                children: [
                                  DefinitionCard2(
                                    title: widget
                                        .definitions[_currentPage].titleEn,
                                    explain: widget
                                        .definitions[_currentPage].explain,
                                    isYourAnswer: false,
                                  ),
                                  DefinitionCard2(
                                    title: widget
                                        .definitions[_currentPage].titleEn,
                                    explain: controller.text,
                                    isYourAnswer: true,
                                  ),
                                ],
                              );
                            }
                            return SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
