import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  Function add;
  NewTransaction(this.add);

  final titleval = TextEditingController();
  final amountval = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleval,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountval,
            ),
            TextButton(
              onPressed: () =>
                  add(titleval.text, double.tryParse(amountval.text) ?? 0.0),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Colors.deepOrange)),
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
