import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/flush_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/previous_and_next_question.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/second_layer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/third_layer.dart';
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
  bool isShowAnswer = false;
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
        isShowAnswer = false;
      });
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
        isShowAnswer = false;
      });
    } else {
      showFlushBar(context, "هذا اول سؤال");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              right: width(15),
              left: width(15),
              top: height(20),
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
                            return
                              Padding(
                              padding: EdgeInsets.only(top: height(80)),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: height(40),
                                      bottom: height(30),
                                      right: width(20),
                                      left: width(20),
                                    ),
                                    width: width(340),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white24,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: Colors.amberAccent,

                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Text(
                                                widget.definitions[index].titleEn,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        TextFormField(
                                          controller: controller,
                                          maxLines: null,
                                          minLines: 5,
                                          keyboardType: TextInputType.multiline,
                                          decoration: InputDecoration(
                                            hintText:
                                                "ادخل تعريف ${widget.definitions[index].titleEn}  هنا.... ",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isShowAnswer = !isShowAnswer;
                                              });
                                            },
                                            child: Container(
                                              height: height(30),
                                              width: width(230),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  isShowAnswer
                                                      ? "اخفاء الاجابة"
                                                      : "اظهار الاجابة",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SecondLayer(
                                    chapter: "",
                                    questionNumberInTheChapter:
                                        widget.definitions.length,
                                    questionIReceived: index + 1,
                                  ),
                                  ThirdLayer(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      if (isShowAnswer)
                        DefinitionCard2(
                          title: widget.definitions[_currentPage].titleEn,
                          explain: widget.definitions[_currentPage].explain, isYourAnswer: false,
                        ),
                      if (isShowAnswer)
                        DefinitionCard2(
                          title: widget.definitions[_currentPage].titleEn,
                          explain: controller.text, isYourAnswer: true,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
