import 'package:flutter/material.dart';
import 'package:hello/all_questions_and_answers.dart';
import 'package:hello/components/single_question_result.dart';
import 'package:hello/constants.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
      {super.key,
      required this.answersSelectedByUser,
      required this.moveToStartScreen()});

  List<String> answersSelectedByUser;

  Function moveToStartScreen;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int correctAnswers = 0;

  void correctAnswersFunction() {
    for (var i = 0; i < widget.answersSelectedByUser.length; i++) {
      if (widget.answersSelectedByUser[i].toString() ==
          questionsList[i].answers[0]) {
        correctAnswers++;
      }
    }
  }

  List<Map<String, dynamic>> myMapsList = [];

  void fetchData() {
    for (var i = 0; i < widget.answersSelectedByUser.length; i++) {
      myMapsList.add({});
      myMapsList[i]['question-index'] = i;
      myMapsList[i]['question-statement'] = questionsList[i].questionStatement;
      myMapsList[i]['actual-answer'] = questionsList[i].answers[0];
      myMapsList[i]['picked-answer'] = widget.answersSelectedByUser[i];
      if (myMapsList[i]['actual-answer'] == myMapsList[i]['picked-answer']) {
        myMapsList[i]['isCorrect'] = true;
      } else {
        myMapsList[i]['isCorrect'] = false;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    correctAnswersFunction();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print(myMapsList);
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your score is ${correctAnswers}/${widget.answersSelectedByUser.length}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 330,
                  child: SingleChildScrollView(
                    child: Column(
                      children: myMapsList.map((e) {
                        return SingleQuestionResult(
                          myMap: e,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    widget.moveToStartScreen();
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        'Retake Quiz',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
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
