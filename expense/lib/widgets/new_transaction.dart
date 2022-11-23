import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function add;

  NewTransaction(this.add);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleval = TextEditingController();

  final amountval = TextEditingController();

  void submitAction() {
    String title = titleval.text;
    double amount = double.parse(amountval.text);
    if (title.isEmpty || amount <= 0.0) {
      return;
    }
    widget.add(title, amount);
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitAction(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountval,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitAction(),
            ),
            TextButton(
              onPressed: submitAction,
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
