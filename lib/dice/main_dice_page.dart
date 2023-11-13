import 'package:course_app/dice/dice_rolling.dart';
import 'package:course_app/widgets/gradient_container.dart';
import 'package:flutter/material.dart';

class MainDicePage extends StatelessWidget {
  const MainDicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Dice roll'),
      ),
      body: const GradientContainer(
        startColor: Color.fromARGB(255, 255, 169, 163),
        endColor: Color.fromARGB(255, 235, 110, 152),
        child: DiceRolling(),
      ),
    );
  }
}
