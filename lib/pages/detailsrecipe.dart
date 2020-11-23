import 'package:flutter/material.dart';
import 'package:recipe_demo/pages/videoplayer.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';

class DetailsRecipe extends StatefulWidget {
  @override
  _DetailsRecipeState createState() => _DetailsRecipeState();
}

class _DetailsRecipeState extends State<DetailsRecipe>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToolsUtilities.mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _headerCover(),
            _contentHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 4,
                color: ToolsUtilities.whiteColor,
              ),
            ),
            _tabsContent()
          ],
        ),
      ),
    );
  }

  Widget _headerCover() {
    return Stack(
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
        AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite,
              ),
            )
          ],
        ),
        Positioned(
          left: 100,
          bottom: 25,
          child: Text(
            'Recipe Name',
            style: TextStyle(
                color: ToolsUtilities.whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _contentHeader() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(
                (Icons.timer),
                color: ToolsUtilities.whiteColor,
              ),
              Text("60 Mins",
                  style: TextStyle(
                      color: ToolsUtilities.whiteColor,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Icon(
                (Icons.people),
                color: ToolsUtilities.whiteColor,
              ),
              Text("4 Peoples",
                  style: TextStyle(
                      color: ToolsUtilities.whiteColor,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Icon(
                (Icons.room_service),
                color: ToolsUtilities.whiteColor,
              ),
              Text(
                "40 Mins",
                style: TextStyle(
                    color: ToolsUtilities.whiteColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _tabsContent() {
    return Column(
      children: [
        TabBar(
            indicatorColor: ToolsUtilities.whiteColor,
            controller: _tabController,
            tabs: [
              Tab(
                text: ("Description"),
                icon: Icon(Icons.receipt),
              ),
              Tab(
                text: ("Integrations"),
                icon: Icon(Icons.fastfood),
              ),
              Tab(
                text: ("Video"),
                icon: Icon(Icons.videocam),
              ),
            ]),
        Container(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(controller: _tabController, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ToolsUtilities.whiteColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Cooking",
                        style: TextStyle(
                            color: ToolsUtilities.mainColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          ToolsUtilities.descriptionParagraph +
                              ToolsUtilities.descriptionParagraph,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 18, color: ToolsUtilities.secondColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ToolsUtilities.whiteColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You Will Need",
                        style: TextStyle(
                            color: ToolsUtilities.mainColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: ToolsUtilities.mainColor,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ToolsUtilities.integrationParagraph  + ToolsUtilities.integrationParagraph,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 18, color: ToolsUtilities.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoApp()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color: ToolsUtilities.mainColor,
                          image: DecorationImage(
                              image: NetworkImage(ToolsUtilities.imageRecipes[6]),
                              fit: BoxFit.cover
                          )),
                    ),
                    Icon(Icons.play_circle_outline,color: ToolsUtilities.whiteColor,size: 50,)
                  ],
                ),
              ),
            )
          ]),
        )
      ],
    );
  }
}
