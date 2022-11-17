import 'package:flutter/material.dart';

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
    'To know is to know that you know nothing',
    'I go to school',
    'ok bye',
    'good night'
  ];

  void click() {
    setState(() {
      ok++;
    });
    print(ok);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PSTU CSE-16'),
        ),
        body: Column(
          children: [
            Text(speech[ok % speech.length]),
            ElevatedButton(child: Text('bh'), onPressed: click)
          ],
        ),
      ),
    );
  }
}
