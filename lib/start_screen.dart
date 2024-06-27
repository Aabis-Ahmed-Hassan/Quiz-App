import 'package:flutter/material.dart';
import 'package:hello/constants.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.changeScreen, {super.key});

  Function changeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: gradientColor,
          )),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/quiz-logo.png',
                    width: 250,
                    color: Colors.white.withOpacity(0.55),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Learn Flutter The Fun Way!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      changeScreen();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_right,
                        ),
                        Text(
                          'Take Quiz',
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
          )),
    );
  }
}
