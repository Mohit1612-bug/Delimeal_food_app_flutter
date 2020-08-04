
import 'package:delimeal/category_screen.dart';
import 'package:delimeal/favourites_screen.dart';
import 'package:delimeal/main_drawer.dart';
import 'package:flutter/material.dart';
import './models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>favourite_Meals;
  TabsScreen(this.favourite_Meals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String,Object>>_pages =[];
  int selectedIndex=0;
  @override
  void initState() {
    _pages=[
    {'page':CategoryScreen(),'title':"Categories"},
    {'page':FavouritesScreen(widget.favourite_Meals),'title':'Your Favourites'}
  ];
    super.initState();
  }
  void _selectedScreen(int index) {
    setState(() {
      selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:Text(_pages[selectedIndex]['title']),
        ),
        drawer: MainDrawer(),
        body:_pages[selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedScreen,
          
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("category"), 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("favourite"), 
            ),
          ],
        ),   
    );
  }
}