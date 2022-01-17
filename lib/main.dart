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
                    'test application quiz ',
                    style: TextStyle(color: Colors.white, fontSize: 25),
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
                  onPressed: () {},
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
                    print('test');
                  },
                  child: const Text('False'),
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 30.0,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 30.0,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 30.0,
                ),
                Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 30.0,
                ),
                Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 30.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
