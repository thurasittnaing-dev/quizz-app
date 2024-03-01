import 'package:flutter/material.dart';
import 'package:quizz/database/questions.dart';
import 'package:quizz/screens/quizz_screen.dart';
import 'package:quizz/screens/result_screen.dart';
import 'package:quizz/screens/start_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String currentScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen(String screen) {
    setState(() {
      if (screen == 'start-screen') {
        selectedAnswers = [];
      }

      currentScreen = screen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (questions.length == selectedAnswers.length) {
      switchScreen('result-screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreenWidget = StartScreen(changeScreen: switchScreen);

    // Initialization Active Screen Widget
    switch (currentScreen) {
      case 'start-screen':
        activeScreenWidget = StartScreen(
          changeScreen: switchScreen,
        );
        break;
      case 'quizz-screen':
        activeScreenWidget = QuizzScreen(
          chooseAnswer,
        );
        break;
      case 'result-screen':
        activeScreenWidget = ResultScreen(
          selectedAnswers: selectedAnswers,
          restartQuizz: switchScreen,
        );
        break;
      default:
        activeScreenWidget = StartScreen(changeScreen: switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreenWidget,
        ),
      ),
    );
  }
}
