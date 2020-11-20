import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:recipe_demo/pages/allrecipespage.dart';
import 'package:recipe_demo/pages/categoriespage.dart';
import 'package:recipe_demo/pages/favoritepage.dart';
import 'package:recipe_demo/pages/homepage.dart';
import 'package:recipe_demo/pages/infopage.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}
class _StartPageState extends State<StartPage> {
  int _page =2;
  GlobalKey _menuKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs =[
      InfoPage(),
      CategoriesPage(),
      HomePage(),
      AllRecipesPage(),
      FavoritePage(),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key:_menuKey ,
        index: _page,
        items: [
          Icon(Icons.info,color: ToolsUtilities.whiteColor),
          Icon(Icons.calendar_view_day,color: ToolsUtilities.whiteColor),
          Icon(Icons.whatshot,color: ToolsUtilities.whiteColor),
          Icon(Icons.receipt,color: ToolsUtilities.whiteColor),
          Icon(Icons.favorite,color: ToolsUtilities.whiteColor)
        ],
        onTap: (index){
          setState(() {
            _page = index;
          });

        },
        color: ToolsUtilities.mainColor,
        backgroundColor: ToolsUtilities.whiteColor,
        animationCurve: Curves.easeInOut,
      ),
      body:tabs[_page],
    );
  }
}
