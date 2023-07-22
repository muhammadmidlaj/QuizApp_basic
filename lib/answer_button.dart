import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerTxt, required this.onTap});
  final String answerTxt;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: const Color.fromARGB(255, 31, 14, 60),
          foregroundColor: Colors.white),
      child: Text(answerTxt),
    );
  }
}
