import 'package:flutter/material.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class ManageTransaction extends StatefulWidget {
  @override
  State<ManageTransaction> createState() => _ManageTransactionState();
}

class _ManageTransactionState extends State<ManageTransaction> {
  List<Transaction> transactions = [];

  void addTransaction(String title, double amount) {
    final transaction =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());
    setState(() {
      transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(addTransaction), TransactionList(transactions)],
    );
  }
}
