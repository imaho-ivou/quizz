import 'package:quizz/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question('question1', true),
    Question('question2', true),
    Question('question3', false),
    Question('question4', false)
  ];
  List _suiviScore = [];

  int _questionNumber = 0;

  String getQuestion() {
    return _questions[_questionNumber].question;
  }

  bool getAnswer() {
    return _questions[_questionNumber].reponse;
  }

  int getQuestionLength() {
    return _questions.length;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) _questionNumber++;
  }
  //function qui remet a zero le quizz

  int reset() {
    return _questionNumber = 0;
  }
}
