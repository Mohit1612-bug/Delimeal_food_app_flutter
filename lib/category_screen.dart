import 'package:delimeal/dummy_data.dart';
import 'category_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children:DUMMY_CATEGORIES.map((catdata){
          return  CategoryItem(id:catdata.id, title:catdata.title,color:catdata.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing:20,
        ),
    );
  }
}