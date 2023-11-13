import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnotherQuiz extends StatelessWidget {
  const AnotherQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/another');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 3, 82, 3),
              Color.fromARGB(255, 39, 191, 36),
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
            Container(
              width: 80,
              height: 80,
              color: Colors.blue,
            ),
            // Image.asset(
            //   'assets/quiz/images/twilight_screen.png',
            //   width: 130,
            // ),
            Expanded(
              child: Text(
                'AnotherQuiz',
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
