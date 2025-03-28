import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/manager/identification_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/second_layer.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/widget/stack/third_layer.dart';

class IdentificationQuizCard extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String explain;
  final int allQuestions;
  final int index;

  const IdentificationQuizCard({
    super.key,
    required this.controller,
    required this.title,
    required this.explain,
    required this.allQuestions,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
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
                    hintText: "ادخل تعريف $title هنا.... ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.read<ShowAnswerBloc>().add(ToggleShowAnswer());
                    },
                    child: BlocBuilder<ShowAnswerBloc, ShowAnswerState>(
                      builder: (context, state) {
                        return Container(
                          height: height(30),
                          width: width(230),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              state.isShowAnswer ? "اخفاء الاجابة" : "اظهار الاجابة",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SecondLayer(
            chapter: "",
            questionNumberInTheChapter: allQuestions,
            questionIReceived: index + 1,
          ),
          ThirdLayer(),
        ],
      ),
    );
  }
}