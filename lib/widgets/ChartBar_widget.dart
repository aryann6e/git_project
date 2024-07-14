import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar_widget extends StatelessWidget {
  String? dayname;
  num? spendingAmount;
  double? spendingPCToftotal;
  ChartBar_widget(this.dayname, this.spendingAmount, this.spendingPCToftotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          // height: constraints.maxHeight * 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          // width: constraints.maxWidth * 0.80,
          width: 45,
          child: Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.15,
                child: Text(
                  dayname!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.purple),
                    borderRadius: BorderRadius.circular(4)),
                height: constraints.maxHeight * 0.60,
                // height: 60,
                width: 15,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: spendingPCToftotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    '₹${spendingAmount!.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
