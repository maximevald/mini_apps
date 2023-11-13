import 'package:course_app/quiz/widgets/another_quiz.dart';
import 'package:course_app/quiz/widgets/twilight_quiz.dart';
import 'package:flutter/material.dart';

class ChooseQuizScreen extends StatelessWidget {
  const ChooseQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Quizzes',
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3,
        crossAxisCount: 1,
        children: const [
          TwilightQuiz(),
          AnotherQuiz(),
        ],
      ),
    );
  }
}
