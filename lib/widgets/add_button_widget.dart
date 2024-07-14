import 'package:flutter/material.dart';

class Button_widget extends StatelessWidget {
  final Function show_input;
  Button_widget(this.show_input);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        show_input(context);
      },
      icon: Icon(Icons.add),
      label: Text("add"),
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          )),
    );
  }
}
