import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meals_item.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = 'meals';

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catId = routeArg['id'];
    final catTitle = routeArg['title'];

    final cMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            catTitle,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Meal_item(
              id: cMeals[index].id,
                title: cMeals[index].title,
                img_url: cMeals[index].imageUrl,
                complexity: cMeals[index].complexity,
                affordability: cMeals[index].affordability,
                duration: cMeals[index].duration);
          },
          itemCount: cMeals.length,
        ));
  }
}
