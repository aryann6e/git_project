import 'package:flutter/material.dart';
import '../models/categories_data.dart';
import '../Categories_Item_widget.dart';

class Categories_Page_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Menu",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        elevation: 0,
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 4 / 3.4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          ...Categories_data.map(
            (catdata) => Categories_item_widget(
              title: catdata.title,
              Id: catdata.id,
              color: catdata.color,
            ),
          ),
        ],
      ),
    );
  }
}
