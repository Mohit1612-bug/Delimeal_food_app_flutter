
import 'package:delimeal/models/meal.dart';
import "package:flutter/material.dart";
import 'meal_item.dart';

class CategoryMeals extends StatelessWidget {
  final List<Meal> availableMeals;
  CategoryMeals(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final Map routeArgs=ModalRoute.of(context).settings.arguments;
    final String categoryId=routeArgs['id'];
    final String categoryTitle=routeArgs['title'];
    final List listOfMeals=availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title:Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return MealItem(
            id: listOfMeals[index].id,
            title:listOfMeals[index].title,
            imageUrl: listOfMeals[index].imageUrl,
            duration: listOfMeals[index].duration,
            complexity: listOfMeals[index].complexity,
            affordability: listOfMeals[index].affordability,
          );
        },
        itemCount: listOfMeals.length,
      )
    );
  }
}