import 'package:audioplayers/audioplayers.dart';
import 'package:course_app/quiz/models/questions_twilight.dart';
import 'package:course_app/quiz/another_quiz/screens/questions_screen.dart';
import 'package:course_app/quiz/another_quiz/screens/quiz_start_screen.dart';
import 'package:course_app/quiz/another_quiz/screens/result_screen.dart';
import 'package:course_app/widgets/gradient_container.dart';
import 'package:flutter/material.dart';

class QuizAnother extends StatefulWidget {
  const QuizAnother({super.key});

  @override
  State<QuizAnother> createState() => _QuizAnotherState();
}

class _QuizAnotherState extends State<QuizAnother> {
  late Widget activeScreen;
  final List<String> selectedAnswers = [];
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    activeScreen = QuizStartScreen(switchScreen);
  }

  void switchScreen() {
    player
      ..stop()
      ..play(AssetSource('quiz/audio/twilight.mp3')); //Music
    setState(() {
      selectedAnswers.clear();
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questionsTwilight.length) {
      setState(() {
        activeScreen = ResultScreen(
          switchToMenu: startScreen,
          onRestart: switchScreen,
          chosenAnswers: selectedAnswers,
        );
      });
    }
  }

  void startScreen() {
    player.stop();
    setState(() {
      selectedAnswers.clear();
      activeScreen = QuizStartScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    //For stop music if we tap back button in appBar
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        player.stop();
        return false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Another'),
        ),
        body: GradientContainer(
          startColor: const Color.fromARGB(255, 3, 82, 3),
          endColor: const Color.fromARGB(255, 39, 191, 36),
          child: activeScreen,
        ),
      ),
    );
  }
}
