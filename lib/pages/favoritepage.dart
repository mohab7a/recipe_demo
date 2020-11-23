import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';
import 'detailsrecipe.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List faveIcons = [1,3,5,7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolsUtilities.mainColor,
        title: Text("My Favorite Recipe"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: ListView.builder(
          itemCount: ToolsUtilities.imageRecipes.length,
            itemBuilder: (context,index){
            return _favouriteCard(index);
        }),
      )
    );
  }

  Widget _favouriteCard(int index){
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsRecipe()));},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height *0.50,
              width: MediaQuery.of(context).size.width * 1.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ToolsUtilities.mainColor,
                  image: DecorationImage(
                      image: NetworkImage(ToolsUtilities.imageRecipes[index]),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  color: ToolsUtilities.secondColor.withOpacity(0.5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title Recipe',
                          style: TextStyle(
                            color: ToolsUtilities.whiteColor,
                            fontSize: 18,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                         Row(
                           children: [
                             Icon(
                               Icons.timer,
                               size: 17,
                               color: ToolsUtilities.whiteColor,
                             ),
                             SizedBox(width: 5),
                             Text('60 minutes',
                                 style: TextStyle(
                                     color: ToolsUtilities.whiteColor,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 17)),
                           ],
                         ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('The Short Description For Recipe',
                                  style: TextStyle(
                                      color: ToolsUtilities.whiteColor,
                                      fontSize: 17)),
                              Icon(
                                Icons.favorite,
                                size: 17,
                                color: ToolsUtilities.favColor,
                              ),
                            ],
                          )
                        ])
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
