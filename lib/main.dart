import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Quiz(),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> suiviScore = [];
  // List<String> question = [
  //   'Le piton des neiges est un volcan de la Réunion ?',
  //   'Flutter permet de faire des applications web également ?',
  //   'Php est le language utilisé par Flutter ?',
  //   ''
  // ];

  //
  // List<bool> reponses = [true, true, false];
  int questionNumber = 0;
  List<Question> questions = [
    Question('question1', true),
    Question('question2', true),
    Question('question3', false),
    Question('question3', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    questions[questionNumber].question,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    bool bonnereponse = questions[questionNumber].reponse;

                    setState(
                      () {
                        if (suiviScore.length != questions.length) {
                          if (bonnereponse == true) {
                            suiviScore
                                .add(Icon(Icons.check, color: Colors.green));
                          } else {
                            suiviScore
                                .add(Icon(Icons.close, color: Colors.red));
                          }
                          if (questionNumber < questions.length - 1) {
                            questionNumber++;
                          } // questionNumber = questionNumber + 1 ;
                        }
                      },
                    );
                  },
                  child: const Text('True'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      bool bonnereponse = questions[questionNumber].reponse;
                      if (suiviScore.length != questions.length) {
                        if (bonnereponse == false) {
                          suiviScore
                              .add(Icon(Icons.check, color: Colors.green));
                        } else {
                          suiviScore.add(Icon(Icons.close, color: Colors.red));
                        }
                        if (questionNumber < questions.length - 1) {
                          questionNumber++;
                        } //
                      }
                    });
                  },
                  child: const Text('False'),
                ),
              ),
            ),
            Row(children: suiviScore),
          ],
        ),
      ),
    );
  }
}
