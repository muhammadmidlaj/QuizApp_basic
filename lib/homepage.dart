import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage(
    this.startQuiz, {
    super.key,
  });
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 49, 8, 103),
            Color.fromARGB(255, 64, 16, 147)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              height: 250,
              color: const Color.fromARGB(155, 255, 255, 255),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.start),
              label: const Text('Start Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
