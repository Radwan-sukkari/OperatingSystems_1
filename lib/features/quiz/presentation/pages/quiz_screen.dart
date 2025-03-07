import 'package:flutter/material.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/resources/resources.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: height(75), right: width(20), left: width(20)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: height(600),
                        width: width(350),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:
                          Padding(
                            padding:  EdgeInsets.only(top: height(50)),
                            child: Column(
                              children: [
                                Container(
                                 width: width(280),
                                  height: height(150),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Color(0xff205781).withOpacity(0.5),
                                      width: 1.5
                                    )
                                  ),
                                  child: Text("هنا يكتب السؤتااااااااا"),
                                )
                              ],
                            ),
                          )
                      ),
                      Positioned(
                        top: -17, // جعل العنصر يخرج جزئيًا
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xff205781))),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: -75,
                        child: Image.asset(
                          Images.boyQuiz,
                          height: height(90),
                          width:width(90) ,
                        ),
                      )
                    ],
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
