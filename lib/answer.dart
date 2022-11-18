import 'package:flutter/material.dart';

class Answer extends StatelessWidget
{

  final VoidCallback handler;
  final String ans;
  const Answer(this.handler, this.ans);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple)),
        onPressed: handler,
        child:  Text(ans),
      ),
    );
  }
}
