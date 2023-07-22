import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelected,
  });
  final void Function(String selectedAnswer) onSelected;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  void updateQuestion(String selectedAnswer) {
    widget.onSelected(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.question,
              style: GoogleFonts.lato(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswer().map(
            ((answer) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: AnswerButton(
                  answerTxt: answer,
                  onTap: () {
                    updateQuestion(answer);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
