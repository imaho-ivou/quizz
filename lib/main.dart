import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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
  List<String> question = [
    'Le piton des neiges est un volcan de la Réunion ?',
    'Flutter permet de faire des applications web également ?',
    'Php est le language utilisé par Flutter ?',
    'test'
  ];
  List<bool> reponses = [true, true, false];
  int questionNumber = 0;

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
                    '${question[questionNumber]}',
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
                    int nombreQuestion = question.length;
                    if (nombreQuestion != questionNumber) {
                      bool bonnereponse = reponses[questionNumber];

                      if (bonnereponse == true) {
                        setState(() {
                          suiviScore.add(
                            Icon(Icons.check, color: Colors.green),
                          );
                          questionNumber++;
                        });
                      } else {
                        setState(() {
                          suiviScore.add(
                            Icon(Icons.close, color: Colors.red),
                          );
                          questionNumber++;
                        });
                      }
                    }
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
                    int nombreQuestion = question.length;
                    if (nombreQuestion != questionNumber) {
                      bool bonnereponse = reponses[questionNumber];
                      if (bonnereponse == false) {
                        setState(() {
                          suiviScore.add(
                            Icon(Icons.check, color: Colors.green),
                          );
                          questionNumber++;
                        });
                      } else {
                        setState(() {
                          suiviScore.add(
                            Icon(Icons.close, color: Colors.red),
                          );
                          questionNumber++;
                        });
                      }
                    }
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
