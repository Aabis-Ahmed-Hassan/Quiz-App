import 'package:flutter/material.dart';

class SingleQuestionResult extends StatelessWidget {
  SingleQuestionResult({super.key, required this.myMap});

  Map<String, dynamic> myMap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: myMap['isCorrect'] == true ? Colors.blue : Colors.redAccent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              '${myMap['question-index'] + 1}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //question
            Text(
              myMap['question-statement'].length > 30
                  ? myMap['question-statement'].substring(0, 29) + ' ...'
                  : myMap['question-statement'].toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            //correct answer
            Text(
              myMap['actual-answer'].length > 30
                  ? myMap['actual-answer'].substring(0, 29) + ' ...'
                  : myMap['actual-answer'].toString(),
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            //chosen answer
            Text(
              myMap['picked-answer'].length > 30
                  ? myMap['picked-answer'].substring(0, 29) + ' ...'
                  : myMap['picked-answer'].toString(),
              style: TextStyle(
                color:
                    myMap['isCorrect'] == true ? Colors.blue : Colors.redAccent,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}
