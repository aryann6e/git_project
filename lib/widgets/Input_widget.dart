import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Input_widget extends StatefulWidget {
  final Function add_tx_fun;
  Input_widget(this.add_tx_fun);

  @override
  State<Input_widget> createState() => _Input_widgetState();
}

class _Input_widgetState extends State<Input_widget> {
  final Item_controller = TextEditingController();

  final Amount_controller = TextEditingController();
  var date_picked;
  void submit() {
    if (Item_controller.text.isEmpty ||
        num.parse(Amount_controller.text) <= 0 ||
        date_picked == null) {
      return;
    }
    widget.add_tx_fun(
      Item_controller.text,
      num.parse(Amount_controller.text),
      date_picked,
    );
    Navigator.of(context).pop();
  }

  void show_date_widget() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 6)),
      lastDate: DateTime.now(),
    ).then((picked_Date) {
      if (picked_Date == null) {
        return;
      }
      setState(() {
        date_picked = picked_Date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Product'),
            controller: Item_controller,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: Amount_controller,
            keyboardType: TextInputType.number,
          ),
          Container(
            height: 75,
            child: Row(
              children: [
                Expanded(
                  child: date_picked == null
                      ? Text(
                          "No Date Selected",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          'Selected Date : ${DateFormat.yMMMd().format(date_picked)}',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                ),
                ElevatedButton.icon(
                  onPressed: show_date_widget,
                  icon: Icon(Icons.date_range),
                  label: Text("Date"),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  alignment: Alignment.bottomLeft,
                  fit: BoxFit.scaleDown,
                  child: ElevatedButton.icon(
                    // onPressed: () {
                    //   add_tx_fun(
                    //     Item_controller.text,
                    //     num.parse(Amount_controller.text),
                    //   );
                    // },
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close),
                    label: Text("Close"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                // onPressed: () {
                //   add_tx_fun(
                //     Item_controller.text,
                //     num.parse(Amount_controller.text),
                //   );
                // },
                onPressed: submit,
                icon: Icon(Icons.add),
                label: Text("Transaction"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
