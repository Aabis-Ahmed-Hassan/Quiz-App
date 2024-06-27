import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello/all_questions_and_answers.dart';
import 'package:hello/constants.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen(
      {super.key,
      required this.moveToResultScreen,
      required this.answersSelectedByUser});
  Function moveToResultScreen;

  List<String> answersSelectedByUser;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  //shows each question one by one
  int currentQuestionIndex = 0;
  //onTap function for answers/options of the question
  void onTap(String answer) {
    widget.answersSelectedByUser.add(answer);

    if (currentQuestionIndex < questionsList.length) {
      setState(() {
        currentQuestionIndex++;
      });
    }
    if (currentQuestionIndex == questionsList.length) {
      //move to next screen

      widget.moveToResultScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    List shuffledList = questionsList[currentQuestionIndex].answers.toList();
    shuffledList.shuffle(Random());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  questionsList[currentQuestionIndex].questionStatement,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: 15,
                ),
                //multiple answers

                ...shuffledList.map(
                  (e) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.6),
                      ),
                      onPressed: () {
                        onTap(e);
                      },
                      child: Text(
                        e.length > 30 ? e.substring(0, 29) + ' ...' : e,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
