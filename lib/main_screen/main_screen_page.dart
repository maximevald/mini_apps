import 'package:course_app/main_screen/widgets/dice_widget.dart';
import 'package:course_app/main_screen/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mini Apps'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: const [
          DiceWidget(),
          QuizWidget(),
        ],
      ),
    );
  }
}
