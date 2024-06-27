import 'package:flutter/material.dart';
import 'package:hello/questions_screen.dart';
import 'package:hello/result_screen.dart';
import 'package:hello/start_screen.dart';

class ScreenDeterminer extends StatefulWidget {
  ScreenDeterminer({super.key});
  @override
  State<ScreenDeterminer> createState() {
    return _ScreenDeterminerState();
  }
}

class _ScreenDeterminerState extends State<ScreenDeterminer> {
  String screenToShow = 'start-screen';

  List<String> answersSelectedByUser = [];
  @override
  void moveToQuestionScreen() {
    setState(() {
      screenToShow = 'questions-screen';
      screenToShowWidget = QuestionsScreen(
        moveToResultScreen: moveToResultScreen,
        answersSelectedByUser: answersSelectedByUser,
      );
    });
  }

  void moveToResultScreen() {
    setState(() {
      screenToShow = 'result-screen';
      screenToShowWidget = ResultScreen(
        answersSelectedByUser: answersSelectedByUser,
        moveToStartScreen: retakeQuiz,
      );
    });
  }

  void retakeQuiz() {
    setState(() {
      screenToShow = 'questions-screen';
      answersSelectedByUser = [];
      screenToShowWidget = StartScreen(moveToQuestionScreen);
    });
  }

  Widget? screenToShowWidget = Text('Hello World');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenToShowWidget = StartScreen(moveToQuestionScreen);
    answersSelectedByUser = [];
  }

  @override
  Widget build(BuildContext context) {
    return screenToShowWidget!;
  }
}
