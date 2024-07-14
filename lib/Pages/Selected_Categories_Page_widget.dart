import 'package:flutter/material.dart';
import 'package:food_recipes/Categories_item_info_widget.dart';
import '/models/categories_data.dart';

class Selected_Categories_Page_widget extends StatelessWidget {
  // final String Id;
  // final String title;
  // final Color color;
  // Selected_Categories_Page_widget(
  //     {required this.title, required this.Id, required this.color});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final Id = routeArgs['id'];
    final filteredMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(Id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Categories_item_info_widget(
              video: filteredMeal[index].video,
              title: filteredMeal[index].title,
              id: filteredMeal[index].id,
              affordability: filteredMeal[index].affordability,
              complexity: filteredMeal[index].complexity,
              duration: filteredMeal[index].duration,
              imageUrl: filteredMeal[index].imageUrl,
            );
          },
          itemCount: filteredMeal.length,
        ));
  }
}
