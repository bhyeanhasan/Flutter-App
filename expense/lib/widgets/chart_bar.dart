import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double totalamount;
  final double parcent;

  ChartBar(this.day, this.totalamount, this.parcent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 15, child: FittedBox(child: Text('\$ ${totalamount}'))),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    color: Color.fromRGBO(220, 220, 200, 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                heightFactor: parcent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(day)
      ],
    );
  }
}
