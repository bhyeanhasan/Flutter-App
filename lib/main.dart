import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int ok = 0;
  int score = 0;
  var speech = [
    {
      'question': 'How are you?',
      'answer': [
        {'option': 'fine', 'score': 100},
        {'option': 'normal', 'score': 50},
        {'option': 'bad', 'score': 0},
      ],
    },
    {
      'question': 'How old are you?',
      'answer': [
        {'option': '18-', 'score': 100},
        {'option': '18', 'score': 50},
        {'option': '18+', 'score': 0},
      ],
    },
  ];

  void click(int x) {
    setState(() {
      ok++;
      score+=x;
    });
    print(speech[ok % speech.length]['question']);
  }

  void again() {
    setState(() {
      ok = 0;
      score=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('PSTU CSE-16'),
        ),
        body: ok < speech.length
            ? Column(
                children: [
                  Question(speech[ok % 2]['question'] as String),
                  ...(speech[ok % speech.length]['answer'] as List<Map<String, Object>>)
                      .map((ans) {
                    return Answer( ()=> click(ans['score'] as int), ans['option'] as String);
                  }).toList()
                ],
              )
            : Center(
                child: ElevatedButton(
                  onPressed: again,
                  child: Text(score.toString()),
                ),
              ),
      ),
    );
  }
}
