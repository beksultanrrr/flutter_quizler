import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  bool _isactivated = true;
  List<Question> _questionBank = [
    Question("hello", true),
    Question( "helfd", true),
    Question("hellodfdf",false),
    Question( "hellodfd3333f", true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _isactivated = false;
      // print("here");
      // print(_isactivated);
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnwer() {
    return _questionBank[_questionNumber].answer;
  }

  bool getIsActive() {
    return _isactivated;
  }

  void reset() {
    _questionNumber = 0;
    _isactivated = true;
  }
}
