import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/meals_screen.dart';

class Category_item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const Category_item({Key key, @required this.id, this.title, this.color})
      : super(key: key);

  void selectCat(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealsScreen.routeName, arguments: {

      'id': id,
      'title' : title
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        child: ElevatedButton(
          onPressed: () => selectCat(context),
          child: Text(
            this.title,
            style: Theme.of(context).textTheme.title,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(this.color),
            padding: MaterialStateProperty.all(EdgeInsets.all(16)),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
