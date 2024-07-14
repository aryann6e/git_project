import 'package:flutter/material.dart';
import 'widgets/Chart_widget.dart';
import 'widgets/Input_widget.dart';
import 'widgets/Transactionlist_widget.dart';
import './models/Transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    Home(),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  //main work
  List<Transaction> transaction = [
    // Transaction(
    //   Product_name: "Shoes",
    //   Amount: 1500,
    //   Id: DateTime.now().toString(),
    //   Time: DateTime.now(),
    // ),
    // Transaction(
    //   Product_name: "Shoes",
    //   Amount: 1500,
    //   Id: DateTime.now().toString(),
    //   Time: DateTime.now(),
    // )
  ];
  void Add_new_transaction(
      String? Pd_name, num? Amount, DateTime? date_picked) {
    final new_tx = Transaction(
      Product_name: Pd_name,
      Amount: Amount,
      Id: DateTime.now().toString(),
      date: date_picked,
    );
    setState(() {
      transaction.add(new_tx);
    });
  }

  void show_inputfield(BuildContext ctx) {
    final modalSheet_Widget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: GestureDetector(
            onTap: () {},
            child: Input_widget(Add_new_transaction),
            behavior: HitTestBehavior.opaque,
          ),
        ),
      ],
    );
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: ctx,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: MediaQuery.of(context).orientation == Orientation.landscape
                ? SingleChildScrollView(child: modalSheet_Widget)
                : modalSheet_Widget,
          ),
        );
      },
    );
  }

  List<Transaction> get _recentTransaction {
    return transaction.where((tx) {
      return tx.date!.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void delete_transaction(String id) {
    setState(() {
      transaction.removeWhere((trans) {
        return trans.Id == id;
      });
    });
  }

  bool _show_chart = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final inlandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
          onPressed: () {
            show_inputfield(context);
          },
          icon: Icon(Icons.add),
        )
      ],
      elevation: 0,
    );
    final txlist_widget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.770,
      child: Transactionlist_widget(transaction, delete_transaction),
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: Color.fromARGB(255, 236, 232, 232),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          if (inlandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Show Chart"),
                Switch(
                  value: _show_chart,
                  onChanged: (value) {
                    setState(() {
                      _show_chart = value;
                    });
                  },
                ),
              ],
            ),
          if (!inlandscape)
            Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.230,
              child: Chart_widget(_recentTransaction),
            ),
          if (!inlandscape) txlist_widget,
          if (inlandscape)
            _show_chart == true
                ? Container(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.596,
                    child: Chart_widget(_recentTransaction),
                  )
                : txlist_widget,
          // Button_widget(show_inputfield),
        ],
      ),
      floatingActionButton: !inlandscape
          ? Container(
              height: 65,
              width: 65,
              child: FloatingActionButton(
                child: Icon(Icons.add), //child widget inside this button
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  show_inputfield(context);
                },
              ),
            )
          : Container(),
    );
  }
}
