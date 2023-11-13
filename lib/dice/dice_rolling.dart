import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DiceRolling extends StatefulWidget {
  const DiceRolling({super.key,});
  

  @override
  State<DiceRolling> createState() => _DiceRollingState();
}

class _DiceRollingState extends State<DiceRolling> {
  final randomizer = Random();
  late int currentDiceRoll;
  int counter = 0;
  final player = AudioPlayer();
  

  void rollDice() {
    player.play(AssetSource('dice/audio/rolling-dice.mp3'));

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      counter++;
      setState(() {
        currentDiceRoll = randomizer.nextInt(6) + 1;
      });
      if (counter > 11) {
        timer.cancel();
        player.stop();
        counter = 0;
      }
    });
  }

  @override
  void initState() {
    currentDiceRoll = randomizer.nextInt(6) + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: randomizer.nextDouble() * 180,
          child: Image.asset(
            'assets/dice/images/dice-$currentDiceRoll.png',
            width: 200,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 28)),
          child: const Text('Roll dice'),
        ),
      ],
    );
  }
}
