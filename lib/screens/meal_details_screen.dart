import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = 'meals_Details';
  final Function tog_fav;
  final Function is_fav;

   MealDetails( this.tog_fav,this.is_fav) ;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _buildTitel(BuildContext context, String text) {
     return Text(
       text,
       style: Theme.of(context).textTheme.title,
     );
   }

   _buildCon(Widget child) {
     return Padding(
       padding: const EdgeInsets.all(16.0),
       child: Container(
           padding: EdgeInsets.all(8.0),
           decoration: BoxDecoration(
               border: Border.all(color: Colors.grey),
               color: Colors.white54,
               borderRadius: BorderRadius.circular(10)),
           height: 200,
           width: 300,
           child: child),
     );
   }

   final routeArg2 = ModalRoute.of(context).settings.arguments as String;

   final sMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == routeArg2);
   return Scaffold(
     floatingActionButton: FloatingActionButton(

       onPressed: ()=>tog_fav(routeArg2),
       child: Icon(

           is_fav(routeArg2) ? Icons.star : Icons.star_border,
       ),
     ),
     appBar: AppBar(
       title: Text(sMeal.title),
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Image.network(sMeal.imageUrl),
           SizedBox(
             height: 8.0,
           ),
           _buildTitel(context, "ingredients"),
           _buildCon(ListView.builder(
             itemBuilder: (ctx, index) => Card(
               color: Theme.of(context).primaryColor,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(sMeal.ingredients[index]),
               ),
             ),
             itemCount: sMeal.ingredients.length,
           )),
           _buildTitel(context, "Steps"),
           _buildCon(ListView.builder(
             itemBuilder: (ctx, index) => Column(
               children: [
                 ListTile(
                   leading: CircleAvatar(
                     child: Text("# ${index+1}", style: TextStyle(color: Colors.black),),
                     backgroundColor: Theme.of(context).primaryColor,
                   ),
                   title: Text(sMeal.steps[index]),
                 ),
                 Divider(),

               ],
             ),
             itemCount: sMeal.steps.length,
           )),
         ],
       ),
     ),
   );
  }
}

