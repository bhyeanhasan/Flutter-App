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
  var speech = [
    {
      'question': 'How are you?',
      'answer': ['fine', 'normal', 'bad'],
    },
    {
      'question': 'How old are you?',
      'answer': ['18-', '18', '18+'],
    },
  ];

  void click() {
    setState(() {
      ok++;
    });
    print(speech[ok % speech.length]['question']);
  }

  void again() {
    setState(() {
      ok = 0;
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
                  ...(speech[ok % speech.length]['answer'] as List<String>)
                      .map((ans) {
                    return Answer(click, ans);
                  }).toList()
                ],
              )
            : Center(
                child:ElevatedButton(onPressed: again,child: Text('Reset'),),
              ),
      ),
    );
  }
}
