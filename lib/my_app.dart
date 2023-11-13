import 'package:course_app/dice/main_dice_page.dart';
import 'package:course_app/main_screen/main_screen_page.dart';
import 'package:course_app/quiz/another_quiz/quiz_another.dart';
import 'package:course_app/quiz/chose_quiz_screen.dart';
import 'package:course_app/quiz/twilight/quiz_twilight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.lato(),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      routes: {
        '/dicepage': (context) => const MainDicePage(),
        '/quizpage': (context) => const ChooseQuizScreen(),
        '/twilight': (context) => const QuizTwilight(),
        '/another': (context) => const QuizAnother(),
      },
    );
  }
}
