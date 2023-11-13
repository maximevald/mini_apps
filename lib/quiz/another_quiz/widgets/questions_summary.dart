import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(
    this.summaryData, {
    super.key,
  });
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    const correctColor = Color.fromARGB(255, 70, 174, 74);
    const wrongColor = Color.fromARGB(255, 231, 19, 4);

    return Center(
      child: SizedBox(
        height: 400,
        child: ListView(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['userAnswer'] == data['correctAnswer']
                          ? correctColor
                          : wrongColor,
                    ),
                    child: Center(
                      child: Text(
                        ((data['questionIndex']! as int) + 1).toString(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 244, 232, 255)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data['userAnswer'] as String,
                          style: TextStyle(
                            color: data['userAnswer'] == data['correctAnswer']
                                ? correctColor.withOpacity(0.9)
                                : wrongColor,
                          ),
                        ),
                        Text(
                          data['correctAnswer'] as String,
                          style: TextStyle(
                            color: correctColor,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
