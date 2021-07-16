import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/screens/tabs_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favoriteMeal = [];

  void _toggelefav(String mealId) {
    final existingIndex =
        favoriteMeal.indexWhere((_meal) => _meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere( (meal) =>  meal.id == mealId));
      });
    }
  }

  bool _isMealFav(String id) {
    return  favoriteMeal.any( (meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Color.fromARGB(255, 236, 236, 230),
          primarySwatch: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(fontFamily: "RobotoCondensed"),
              title: TextStyle(
                  fontFamily: "RobotoCondensed",
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      // home: Categories(),
      routes: {
        "/": (context) => TapsScreen(favoriteMeal),
        MealDetails.routeName: (context) =>  MealDetails(_toggelefav, _isMealFav),

        MealsScreen.routeName: (context) => MealsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meal App",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body:
          null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
