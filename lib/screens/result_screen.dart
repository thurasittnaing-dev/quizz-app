import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/database/questions.dart';
import 'package:quizz/widgets/quizz_summary.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswers, required this.restartQuizz});

  final List<String> selectedAnswers;

  final void Function(String) restartQuizz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'questions_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }

    return summary;
  }

  @override
  State<ResultScreen> createState() {
    return _ResultScreenState();
  }
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final summaryData = widget.getSummaryData();
    int totalQuizzCount = questions.length;
    int totalCorrectCount = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your answer $totalCorrectCount out of $totalQuizzCount questions correctly!',
            style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
          QuizzSummary(summaryData),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
              onPressed: () {
                widget.restartQuizz('start-screen');
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quizz'))
        ],
      ),
    );
  }
}
