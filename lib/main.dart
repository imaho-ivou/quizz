import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Quiz(),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu fringilla lorem. Donec et vestibulum orci. Cras nunc nulla, gravida vehicula elit a, mollis vehicula dolor. Mauris eu laoreet turpis.",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150.0),
              child: Card(
                color: Colors.green,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print('test');
                  },
                  child: const Text('True'),
                ),
              ),
              height: 90.0,
              width: 750.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Card(
                color: Colors.red,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print('test');
                  },
                  child: const Text('False'),
                ),
              ),
              height: 90.0,
              width: 750.0,
            ),
          ],
        ),
      ),
    );
  }
}
