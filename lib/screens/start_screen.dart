import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key, required this.changeScreen});

  final void Function(String) changeScreen;

  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quizz.png'),
          Text(
            'Learn the Flutter the fun way!',
            style: GoogleFonts.lato(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                widget.changeScreen('quizz-screen');
              },
              child: const Text('Start Quizz'))
        ],
      ),
    );
  }
}
