class Quizz {
  const Quizz(this.question, this.answers);

  final String question;
  final List<String> answers;

  // Shuffled Answers Getter
  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();

    return shuffledList;
  }
}
