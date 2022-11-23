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
      print(DateFormat.E().format(weekday));
      print(totalsum);
    });
  }

  double get maxspend {
    return chartvalucount.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(chartvalucount);
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(10),
      child: Row(
        children: chartvalucount.map((data) {
          return ChartBar(data['day'].toString(), (data['amount'] as double),
              (data['amount'] as double) / maxspend);
        }).toList(),
      ),
    );
  }
}
