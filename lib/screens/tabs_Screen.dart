import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

class TapsScreen extends StatefulWidget {
  //const TapsScreen({Key? key}) : super(key: key);
  final List<Meal> _favoriteMeal;

   TapsScreen(this._favoriteMeal) ;


  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {



 List<Map<String,Object>> _pages;


 int _selectPageIndex = 0 ;
  _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });

  }

@override
  void initState() {
    // TODO: implement initState
  _pages =[

    {
      "page" : Categories(),
      "title": "Categories",

    }
    ,
    {
      "page" : favoriteScreen(widget._favoriteMeal),
      "title": "Your favorite",

    }

  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border  ),
            label: "favorite",
          ),
        ],
      ),
    );
  }


}
