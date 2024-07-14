import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';

class Transactionlist_widget extends StatelessWidget {
  final List<Transaction> transaction;
  final Function delete_tx;
  Transactionlist_widget(this.transaction, this.delete_tx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transaction.isEmpty
          ? LayoutBuilder(
              builder: (context, Constraints) {
                return Container(
                  height: Constraints.maxHeight * 0.7,
                  child: Image(
                    image: AssetImage('assets/no_activity3.png'),
                  ),
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Container(
                      margin: EdgeInsets.only(
                        top: 3,
                        bottom: 3,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 3,
                          color: Colors.purple,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            '₹${transaction[index].Amount}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Container(
                      child: Text(
                        '${transaction[index].Product_name}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[600],
                        ),
                      ),
                    ),
                    subtitle: Container(
                      child: Text(
                        '${DateFormat.yMMMd().format(transaction[index].date!)}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),
                    ),
                    trailing: MediaQuery.of(context).size.width < 400
                        ? IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              delete_tx(transaction[index].Id);
                            },
                          )
                        : TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            label: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}

    //     children: [
    //       ...transaction.map(
    //         (tx) {
    //           return Container(
    //             child: Card(
    //               elevation: 5,
    //               child: Row(
    //                 children: [
    //                   Container(
    //                     margin: const EdgeInsets.all(5),
    //                     padding: const EdgeInsets.symmetric(
    //                       vertical: 13,
    //                       horizontal: 13,
    //                     ),
    //                     decoration: BoxDecoration(
    //                       border: Border.all(
    //                         width: 2.5,
    //                         color: Colors.purple,
    //                       ),
    //                     ),
    //                     child: Text(
    //                       ('₹${tx.Amount}'),
    //                       style: const TextStyle(
    //                         fontSize: 17,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                     padding: const EdgeInsets.symmetric(
    //                       vertical: 5,
    //                       horizontal: 8,
    //                     ),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           tx.Product_name!,
    //                           style: const TextStyle(
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.purple,
    //                           ),
    //                         ),
    //                         Text(
    //                           // '${tx.Time}',
    //                           // DateFormat().format(tx.Time!),
    //                           // DateFormat('dd-MM-yyyy').format(tx.Time!),
    //                           DateFormat.yMMMd().format(tx.Time!),
    //                           style: TextStyle(
    //                             fontSize: 15,
    //                             color: Colors.grey[900],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       ).toList(),
    //     ],
    //   ),
    // );
  
