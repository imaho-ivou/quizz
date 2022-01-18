import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart' show Alert;
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

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
  //tableau qui affiche en bas l'ecran le resultat de chaque question
  List<Icon> suiviScore = [];

  //tableau dans lequel le nombre de bonne reponse est recupere
  // et laffiche a la fin le quizz
  List<String> scoreFinal = [];

//fonction qui reset chaque tableau et le compteur
  resetScore() {
    return setState(() {
      suiviScore.clear();
      scoreFinal.clear();
      quizBrain.reset();
    });
  }

  void checkAnswer(bool reponseutilisateur) {
    return setState(
      () {
        bool bonnereponse = quizBrain.getAnswer();
        if (suiviScore.length != quizBrain.getQuestionLength()) {
          if (bonnereponse == reponseutilisateur) {
            suiviScore.add(Icon(Icons.check, color: Colors.green));
            scoreFinal.add('true');
          } else {
            suiviScore.add(Icon(Icons.close, color: Colors.red));
          }
          quizBrain.nextQuestion();
        } else {
          Alert(
            context: context,
            title: 'votre résultat:',
            desc: scoreFinal.length.toString(),
            buttons: [
              DialogButton(
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  resetScore();
                  Navigator.pop(context);
                },
                width: 120,
              )
            ],
          ).show();
        }
      },
    );
  }

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
                    quizBrain.getQuestion(),
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
                    checkAnswer(true);
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
                    checkAnswer(false);
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
