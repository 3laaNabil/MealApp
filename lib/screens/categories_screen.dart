import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

class Categories extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     // appBar:AppBar(title: Text("Meals Categories" , style:Theme.of(context).textTheme.title , ),),
      body: GridView(
        padding: EdgeInsets.all(25.0),
        children: DUMMY_CATEGORIES.map((catData) =>Category_item(id: catData.id, title: catData.title, color: catData.color,)).toList(),
         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
           maxCrossAxisExtent: 200,
           childAspectRatio:3/2 ,
           crossAxisSpacing: 20 ,

         ),

      ),
    );
  }
  
  
}