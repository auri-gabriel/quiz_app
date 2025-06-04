import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                final bool isCorrect =
                    data['user_answer'] == data['correct_answer'];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Circle for question index
                      CircleAvatar(
                        backgroundColor:
                            isCorrect
                                ? const Color.fromARGB(255, 8, 110, 17)
                                : const Color.fromARGB(255, 170, 34, 34),
                        radius: 16,
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: GoogleFonts.lato(
                            color:
                                isCorrect
                                    ? const Color.fromARGB(255, 213, 255, 216)
                                    : const Color.fromARGB(255, 255, 221, 221),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Question and answers
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Your answer: ${data['user_answer']}",
                              style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 241, 241, 241),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Correct answer: ${data['correct_answer']}",
                              style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 16, 255, 8),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
