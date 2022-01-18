import 'package:quizz/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question('question1', true),
    Question('question2', true),
    Question('question3', false),
    Question('question3', false)
  ];

  String getQuestion(int questionNumber) {
    return _questions[questionNumber].question;
  }

  bool getAnswer(int questionNumber) {
    return _questions[questionNumber].reponse;
  }

  int getQuestionLength() {
    return _questions.length;
  }
}
