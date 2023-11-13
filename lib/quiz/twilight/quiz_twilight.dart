import 'package:audioplayers/audioplayers.dart';
import 'package:course_app/quiz/models/questions_twilight.dart';
import 'package:course_app/quiz/twilight/screens/questions_screen.dart';
import 'package:course_app/quiz/twilight/screens/quiz_start_screen.dart';
import 'package:course_app/quiz/twilight/screens/result_screen.dart';
import 'package:course_app/widgets/gradient_container.dart';
import 'package:flutter/material.dart';

class QuizTwilight extends StatefulWidget {
  const QuizTwilight({super.key});

  @override
  State<QuizTwilight> createState() => _QuizTwilightState();
}

class _QuizTwilightState extends State<QuizTwilight> {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
            player.stop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Twilight'),
      ),
      body: GradientContainer(
        startColor: const Color.fromARGB(255, 83, 4, 148),
        endColor: const Color.fromARGB(255, 170, 110, 235),
        child: activeScreen,
      ),
    );
  }
}
