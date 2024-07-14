import 'package:flutter/material.dart';
import 'ChartBar_widget.dart';
import '../models/Chart.dart';
import 'package:intl/intl.dart';

class Chart_widget extends StatelessWidget {
  final recentTransaction;
  Chart_widget(this.recentTransaction);

  List<Chart> get transaction_chart {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double weektotal = 0;
        double totalamount = 0;

        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalamount += recentTransaction[i].Amount;
          }
          weektotal = weektotal + recentTransaction[i].Amount;
        }
        // print("totlaweek : ${weekt}");
        print(DateFormat.E().format(weekDay));
        print(totalamount);
        Chart rtx;
        return rtx = Chart(
          Day: '${DateFormat.E().format(weekDay)}',
          Amount: totalamount,
          Totalweek: weektotal,
        );
      },
    ).reversed.toList();
  }
  // double get weektotal {
  //   return transaction_chart.fold(
  //     0.0,
  //     (sum, item) {
  //       return sum + item.Amount;
  //     },
  //   );
  // }

// print("total week ${weektotal}");
  @override
  Widget build(BuildContext context) {
    transaction_chart;

    return Card(
      margin: EdgeInsets.all(3),
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...transaction_chart.map(
              (tc) {
                return ChartBar_widget(tc.Day, tc.Amount,
                    tc.Totalweek == 0.0 ? 0.0 : tc.Amount / tc.Totalweek);
              },
            ),
          ],
        ),
      ),
    );
  }
}
