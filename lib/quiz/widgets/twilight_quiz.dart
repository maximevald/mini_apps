import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TwilightQuiz extends StatelessWidget {
  const TwilightQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/twilight');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 83, 4, 148),
              Color.fromARGB(255, 170, 110, 235),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/quiz/images/twilight_screen.png',
              width: 130,
            ),
            Expanded(
              child: Text(
                'Twilight',
                style: GoogleFonts.lato(
                  color: Colors.amber,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
