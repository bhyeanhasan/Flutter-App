import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function delete;

  TransactionList(this.transactions, this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: FittedBox(
                        child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                title: Text(
                  transactions[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(DateFormat().format(transactions[index].date)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => delete(transactions[index].id),
                  color: Theme.of(context).errorColor,
                ),
              ),
            ),
          );
          //   Card(
          //   child: Row(
          //     children: [
          //       Container(
          //         margin:
          //             const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //         padding: const EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //             border: Border.all(
          //                 color: Theme.of(context).primaryColor, width: 2)),
          //         child: Text(
          //           '৳: ${transactions[index].amount.toStringAsFixed(2)}',
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 20,
          //               color: Theme.of(context).primaryColor),
          //         ),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             transactions[index].title,
          //             style: const TextStyle(
          //                 fontSize: 16, fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             DateFormat().format(transactions[index].date),
          //             style: const TextStyle(color: Colors.grey),
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // );
        },
        itemCount: transactions.length,
      ),
    );
    ;
  }
}
