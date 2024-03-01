import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quizz extends StatelessWidget {
  Quizz(this.answer, this.onTapAnswer, {super.key});

  final String answer;

  final void Function(String) onTapAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ElevatedButton(
        onPressed: () {
          onTapAnswer(answer);
        },
        child: Text(
          answer,
          style: GoogleFonts.lato(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
