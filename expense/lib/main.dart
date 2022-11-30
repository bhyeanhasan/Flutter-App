import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.orange,
        fontFamily: 'Arial',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [];

  List<Transaction> get recent {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addTransaction(String title, double amount, DateTime date) {
    final transaction =
        Transaction(DateTime.now().toString(), title, amount, date);
    setState(() {
      transactions.add(transaction);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void addPage(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addTransaction);
      },
    );
  }

  bool showchart = false;

  @override
  Widget build(BuildContext context) {
    bool landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var apbar = AppBar(
      title: const Text('Expense List'),
      actions: [
        IconButton(
            onPressed: () => addPage(context),
            icon: const Icon(
              Icons.add,
              size: 30,
            ))
      ],
    );

    var transactionWidget = Container(
        height: (MediaQuery.of(context).size.height -
                apbar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.8,
        child: TransactionList(transactions, deleteTransaction));

    return Scaffold(
      appBar: apbar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image.asset(
          //   'assets/images/room.jpg',
          //   fit: BoxFit.fitWidth,
          //   height: MediaQuery.of(context).size.height * 0.2,
          // ),

          if (landscape)
            Column(
              children: [
                Switch(
                    value: showchart,
                    onChanged: (val) {
                      setState(() {
                        showchart = val;
                      });
                    })
              ],
            ),

          if (landscape)
            showchart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            apbar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        .7,
                    child: Chart(recent))
                : transactionWidget,

          if (!landscape)
            Container(
                height: (MediaQuery.of(context).size.height -
                        apbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .2,
                child: Chart(recent)),
          if (!landscape) transactionWidget,
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => addPage(context),
        hoverElevation: 30,
        child: Icon(Icons.add),
      ),
    );
  }
}
