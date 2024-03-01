import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizzSummary extends StatelessWidget {
  const QuizzSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            String title =
                '${(data['questions_index'] as int) + 1}. ${data['question']}';
            Color userAnswerColor =
                data['user_answer'] == data['correct_answer']
                    ? Colors.green.shade200
                    : Colors.red;
            return Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white10, Colors.white10],
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.lato(
                            color: Colors.orangeAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Your Answer: ${data['user_answer'] as String}',
                          style: GoogleFonts.lato(color: userAnswerColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Correct Answer: ${data['correct_answer'] as String}',
                          style: GoogleFonts.lato(color: Colors.green.shade200),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
