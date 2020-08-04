


import 'package:flutter/material.dart';
import './dummy_data.dart';

class MealDetail extends StatelessWidget {
  final Function addToFavourites ;
  final Function isFavourite ;
  MealDetail(this.addToFavourites,this.isFavourite);
  Widget buildSectionTitle(String text) {
    return Container(
            margin: EdgeInsets.symmetric(vertical:10),
            child:Text(
              text,
            ),
          );
  }
  Widget buildContainer(Widget child) {
    return Container(
            decoration: BoxDecoration(
              color:Colors.white,
              border:Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height:150,
            width:300,
            child:child,
    );      
  }
  @override
  Widget build(BuildContext context) {
    final  mealId=ModalRoute.of(context).settings.arguments;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) {
      return meal.id== mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title:Text("${selectedMeal.title}"),
      ),
      body:SingleChildScrollView(
          child: Column(
          children:<Widget>[
            Container(
              height:300,
              width:double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context,index){
                  return Card(
                    color: Theme.of(context).accentColor,
                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical:5,horizontal:10),
                      child: Text(selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ), 
            buildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(itemBuilder: (context,index){
                return Column(
                  children: [
                    ListTile(
                      leading:CircleAvatar(child:Text("# ${(index)}")),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                );
              })
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealId)?Icons.star:Icons.star_border,
        ),
        onPressed: (){
        return addToFavourites(mealId);
      }),
    );
  }
}