import 'package:delimeal/dummy_data.dart';
import 'package:delimeal/meal_detail.dart';
import 'package:delimeal/models/meal.dart';
import 'package:delimeal/tabs_screen.dart';
import 'package:flutter/material.dart';


import './category_meals.dart';
import './filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool>_filters={
    'glunten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal>_availableMeals=DUMMY_MEALS;
  List<Meal>_favouriteMeals=[];
  void _setFilters(Map<String, bool>filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals=DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  void _toggleFavourite(String mealId){
   final existingIndex =_favouriteMeals.indexWhere((meal) => meal.id == mealId);
   if(existingIndex>=0){
     setState(() {
       _favouriteMeals.removeAt(existingIndex);
     });
   }
   else{
     setState(() {
       _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) =>meal.id == mealId));
     });
   }
  }
  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) =>meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
      ),
      home: TabsScreen(_favouriteMeals),
      routes: {
        '/category_meals':(context)=>CategoryMeals(_availableMeals),
        '/meal_details':(context)=>MealDetail(_toggleFavourite,_isMealFavourite),
        '/filters_screen':(context)=>FilterScreen(_setFilters),
      },
      onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (context){
          return CategoryMeals(_availableMeals);
        });
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context){
          return CategoryMeals(_availableMeals);
        });
      },
    );
  }
}


