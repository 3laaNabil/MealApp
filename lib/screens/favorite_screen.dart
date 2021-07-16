import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/meals_item.dart';
class favoriteScreen extends StatelessWidget {
  //const favoriteScreen({Key? key}) : super(key: key);


  final List<Meal> _favoriteMeal;

   favoriteScreen( this._favoriteMeal) ;



  @override
  Widget build(BuildContext context) {

    if(_favoriteMeal.isEmpty){

      return Center(child: Text("You have no favorite yet. "),);

    }else{

return ListView.builder(
  itemBuilder: (ctx, index) {
    return Meal_item(
        id: _favoriteMeal[index].id,
        title: _favoriteMeal[index].title,
        img_url: _favoriteMeal[index].imageUrl,
        complexity: _favoriteMeal[index].complexity,
        affordability: _favoriteMeal[index].affordability,
        duration: _favoriteMeal[index].duration);
  },
  itemCount: _favoriteMeal.length,
) ;


    }


  }

}
