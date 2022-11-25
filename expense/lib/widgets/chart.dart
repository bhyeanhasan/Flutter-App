import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatefulWidget {
  late final List<Transaction> transactions;

  Chart(this.transactions);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get chartvalucount {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0;
      for (int i = 0; i < widget.transactions.length; i++) {
        if (widget.transactions.elementAt(i).date.day == weekday.day &&
            widget.transactions.elementAt(i).date.month == weekday.month &&
            widget.transactions.elementAt(i).date.year == weekday.year) {
          totalsum += widget.transactions.elementAt(i).amount;
        }
      }
      return {'day': DateFormat.E().format(weekday), 'amount': totalsum};
    }).reversed.toList();
  }

  double get maxspend {
    return chartvalucount.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: chartvalucount.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'].toString(),
                  (data['amount'] as double),
                  maxspend == 0 ? 0 : (data['amount'] as double) / maxspend),
            );
          }).toList(),
        ),
      ),
    );
  }
}
