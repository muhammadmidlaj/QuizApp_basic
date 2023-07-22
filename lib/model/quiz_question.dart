class QuizQuestionModel {
  const QuizQuestionModel(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final shuffledAnswer = List.of(answers); //get copy of answer list
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
