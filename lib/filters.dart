
import "package:flutter/material.dart";
import './main_drawer.dart';

class FilterScreen extends StatefulWidget {
   final Function saveFilters;
   FilterScreen(this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluntenFree = false;
  bool _vegetarian= false;
  bool _vegan= false;
  bool _lactoseFree = false;
 
  Widget _buildSwitchListTile(String title,String description,bool currentValue,Function updateValue) {
    return SwitchListTile(
                  title: Text(title),
                  value: currentValue,
                  subtitle: Text(description),
                  onChanged: updateValue,
                );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Settings"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final selectedFilters={
              'glunten':_gluntenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            return widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding:EdgeInsets.all(20),
            child: Text("Adjust Your Meal Selection"),
          ),
          Expanded(
            child:ListView(
              children: <Widget>[
                _buildSwitchListTile("Glunten Free","Only Includes Glunten Free Meals",_gluntenFree,(newValue){
                  setState(() {
                    _gluntenFree = newValue;
                  });
                }),
                _buildSwitchListTile("Vegetarian ","Only Includes Vegetarian Meals",_vegetarian,(newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile("Lactose Free","Only Includes Lactose Free Meals",_lactoseFree,(newValue){
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile("Vegan","Only Includes Vegan Meals",_vegan,(newValue){
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ) 
          ),
        ],
      ),
    );
  }
}