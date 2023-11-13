import 'package:course_app/quiz/models/questions_another.dart';
import 'package:course_app/quiz/another_quiz/widgets/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.switchToMenu,
    required this.chosenAnswers,
    required this.onRestart,
    super.key,
  });
  final void Function() onRestart;
  final void Function() switchToMenu;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get getSummaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questionsAnother[i].question,
        'correctAnswer': questionsAnother[i].answers[0],
        'userAnswer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData;
    final numTotalQuestions = questionsAnother.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correctAnswer'] == data['userAnswer'];
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You answer the $numCorrectQuestions of $numTotalQuestions',
              style: GoogleFonts.lato(color: Colors.white),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: onRestart,
              style: buttonStyle,
              child: const Text('Restart'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: switchToMenu,
              style: buttonStyle,
              child: const Text('Menu'),
            ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle buttonStyle = OutlinedButton.styleFrom(
  side: const BorderSide(
    width: 0.1,
  ),
  backgroundColor: const Color.fromARGB(255, 125, 28, 167),
  foregroundColor: Colors.white,
);
