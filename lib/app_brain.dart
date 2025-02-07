import 'question.dart';

class Appbrain {
  int _questionIndex = 0;  // Stores the current question index

  final List<Question> _questiongroupe = [
    Question(questiontext: 'yasou', anser: true),
    Question(questiontext: 'ashe', anser: true),
    Question(questiontext: 'smolder', anser: true),
    Question(questiontext: 'aphelios', anser: true),
    Question(questiontext: 'veigo', anser: false),
    Question(questiontext: 'garen', anser: false),
    Question(questiontext: 'teemo', anser: true),
    Question(questiontext: 'khazix', anser: true),
    Question(questiontext: 'ambressa', anser: false),
  ];

  String getQuestiontext() {
    return _questiongroupe[_questionIndex].questiontext;
  }

  bool getanser() {
    return _questiongroupe[_questionIndex].anser;
  }

  int getlength() {
    return _questiongroupe.length;
  }

  void nextquestion() {
    if (_questionIndex < _questiongroupe.length - 1) {
      _questionIndex++;
    }
  }

  bool isLastQuestion() {
    return _questionIndex == _questiongroupe.length - 1;
  }

  void reset() {
    _questionIndex = 0; // Reset the quiz to start over
  }
}
