import 'package:flutter/material.dart';

class DiceWidget extends StatelessWidget {
  const DiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/dicepage');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 169, 163),
              Color.fromARGB(255, 235, 110, 152),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            width: 3,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/dice/images/dice-3.png',
                width: 100,
              ),
            ),
            const Text(
              'Dice rolling',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
