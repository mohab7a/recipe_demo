import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';
import 'detailsrecipe.dart';

class AllRecipesPage extends StatefulWidget {
  @override
  _AllRecipesPageState createState() => _AllRecipesPageState();
}

class _AllRecipesPageState extends State<AllRecipesPage> {
  List faveIcons = [1,3,5,7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ToolsUtilities.mainColor,
        title: Text("All Recipes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            _featuredCard(0),
            _featuredCard(1),
            _featuredCard(2),
            _featuredCard(3),
            _featuredCard(4),
            _featuredCard(5),
            _featuredCard(6),
            _featuredCard(7),
          ],
        ),
      ),
    );
  }

  Widget _featuredCard(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsRecipe()));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ToolsUtilities.mainColor,
                  image: DecorationImage(
                      image: NetworkImage(ToolsUtilities.imageRecipes[index]),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: ToolsUtilities.secondColor.withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title Recipe',
                        style: TextStyle(
                          color: ToolsUtilities.whiteColor,
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Icon(
                              Icons.restaurant,
                              size: 15,
                              color: ToolsUtilities.whiteColor,
                            ),
                            SizedBox(width: 5),
                            Text('Category',
                                style: TextStyle(
                                    color: ToolsUtilities.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),
                          ]),
                          Icon(
                            Icons.favorite,
                            color:faveIcons.contains(index) ? ToolsUtilities.favColor : ToolsUtilities.whiteColor,
                          )
                        ],
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
