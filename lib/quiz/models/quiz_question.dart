class QuizQuestion {
  const QuizQuestion({required this.question, required this.answers});

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List<String>.of(answers);
    shuffledList.shuffle();
    return shuffledList;
    // return shuffledList.shuffle() ;
    // Can't return it becose shuffle is a void function
  }
}
