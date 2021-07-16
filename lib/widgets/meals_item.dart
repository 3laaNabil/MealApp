import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class Meal_item extends StatelessWidget {
  final String id;
  final String title;
  final String img_url;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const Meal_item(
      {Key key,
      @required this.title,
      @required this.img_url,
      @required this.complexity,
      @required this.affordability,
      @required this.duration,
      @required this.id})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      default:
        return " null";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;

      default:
        return " null";
        break;
    }
  }

  void selectMeal(BuildContext buildContext) {
    Navigator.of(buildContext).pushNamed(MealDetails.routeName, arguments: id,);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    img_url,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 220,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.timer),
                  Text("$duration min"),
                  Icon(Icons.shopping_bag_outlined),
                  Text("$complexityText"),
                  Icon(Icons.monetization_on_outlined),
                  Text("$affordabilityText"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
