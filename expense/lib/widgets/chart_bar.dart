import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double totalamount;
  final double parcent;

  const ChartBar(this.day, this.totalamount, this.parcent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrains) {
      return Column(
        children: [
          Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(child: Text('\$ ${totalamount}'))),
          Container(
            height: constrains.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: const Color.fromRGBO(220, 220, 200, 1),
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
          Container(height: constrains.maxHeight * 0.15, child: Text(day))
        ],
      );
    });
  }
}
