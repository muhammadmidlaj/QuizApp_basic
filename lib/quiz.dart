import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/homepage.dart';
import 'package:quizapp/qustions_screen.dart';
import 'package:quizapp/resultpage.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];
  @override
  void initState() {
    activeScreen = MyHomePage(swichScreen);
    super.initState();
  }

  void chooseAnswer(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          choosenAnswers: selectedAnswers,
          onRestart: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = MyHomePage(swichScreen);
    });
  }

  void swichScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelected: chooseAnswer,
      );
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 49, 8, 103),
              Color.fromARGB(255, 64, 16, 147)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen),
    );
  }
}
