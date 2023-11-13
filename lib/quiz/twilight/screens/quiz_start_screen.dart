import 'package:flutter/material.dart';

class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/quiz/images/twilight_screen.png',
          width: 300,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Twilight',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(
              width: 0.5,
              color: Color.fromARGB(255, 92, 31, 103),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          icon: const Icon(Icons.arrow_forward_sharp),
          label: const Text(
            'Start Quiz',
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
