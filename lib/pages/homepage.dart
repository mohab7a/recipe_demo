import 'package:flutter/material.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  color: ToolsUtilities.mainColor,
                  image: DecorationImage(
                      image: NetworkImage(ToolsUtilities.imageRecipes[4]),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: 50,left: 22,
              child: Column(
                children: [
                  Text('Daily New Recipes',style: TextStyle(color: ToolsUtilities.whiteColor,fontSize: 18,),),
                  Text('Discovery Now',style: TextStyle(color: ToolsUtilities.whiteColor,fontWeight: FontWeight.bold,fontSize: 22))
                ]
              ),
            )
          ],
        )
      ],
    );
  }
}
