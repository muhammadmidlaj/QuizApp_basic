import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.onRestart});

  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummuryData() {
    final List<Map<String, Object>> summary = [];
    print(choosenAnswers.length);
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'currect_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummuryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswer = summaryData.where((element) {
      return element['currect_answer'] == element['user_answer'];
    }).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You answered $numCorrectAnswer out of $numTotalQuestions questions currectly',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        QuestionSummary(summaryData: getSummuryData()),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(
          onPressed: onRestart,
          label: const Text(
            'Restart Quiz',
          ),
          icon: const Icon(
            Icons.restart_alt,
            size: 30,
          ),
        )
      ],
    );
  }
}
