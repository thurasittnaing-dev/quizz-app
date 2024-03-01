import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/database/questions.dart';
import 'package:quizz/widgets/quizz.dart';

class QuizzScreen extends StatefulWidget {
  QuizzScreen(this.chooseAnswer, {super.key});

  final void Function(String) chooseAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuizzScreenState();
  }
}

class _QuizzScreenState extends State<QuizzScreen> {
  var currentQuestionIndex = 0;

  void onTapAnswer(String answer) {
    setState(() {
      widget.chooseAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuizz = questions[currentQuestionIndex];

    return Container(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuizz.question,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 80,
            ),
            ...currentQuizz.shuffledAnswers.map(
              (answer) {
                return Quizz(answer, onTapAnswer);
              },
            )
          ],
        ),
      ),
    );
  }
}
