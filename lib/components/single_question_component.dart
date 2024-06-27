import 'package:flutter/material.dart';
import 'package:hello/modal/question_class.dart';

class SingleQuestionComponent extends StatelessWidget {
  SingleQuestionComponent({super.key, required this.currentQuestionData});

  QuestionClass currentQuestionData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //question

        Center(
          child: Text(
            currentQuestionData.questionStatement,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        //multiple answers

        ...currentQuestionData.answers.map(
          (e) {
            return TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              onPressed: () {},
              child: Text(
                e.length > 3 ? e.substring(0, 3) + '...' : e,
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
    );
  }
}
