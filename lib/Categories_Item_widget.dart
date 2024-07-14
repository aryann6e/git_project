import 'package:flutter/material.dart';
import 'Pages/Selected_Categories_Page_widget.dart';

class Categories_item_widget extends StatelessWidget {
  final String title;
  final String Id;
  final Color color;
  static const routeName = '/Selected_Categories_page';
  Categories_item_widget(
      {required this.title, required this.Id, required this.color});
  void Selected_Categories_Page(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return Selected_Categories_Page_widget(
    //         title: title,
    //         Id: Id,
    //         color: color,
    //       );
    //     },
    //   ),
    // );
    Navigator.of(context).pushNamed(
      Categories_item_widget.routeName,
      arguments: {'id': Id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Selected_Categories_Page(context),
      splashColor: Colors.blueGrey,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
