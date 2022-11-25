import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function add;

  NewTransaction(this.add);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleval = TextEditingController();
  final amountval = TextEditingController();
  DateTime date = DateTime(2019);

  void submitAction() {
    String title = titleval.text;

    if (title.isEmpty || amountval.text == '' || date == DateTime(2019)) {
      return;
    }
    double amount = double.parse(amountval.text);

    widget.add(title, amount, date);
    Navigator.of(context).pop();
  }

  void showDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          date = value;
        });
      }
    });
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
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Text(date == DateTime(2019)
                      ? 'No date chosen!'
                      : 'Picked Date: ${DateFormat.yMd().format(date).toString()}'),
                  Expanded(
                    child: TextButton(
                      onPressed: showDate,
                      child: const Text('Choose Date',
                          style: TextStyle(color: Colors.green)),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitAction,
              child: const Text('Save Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
