import 'package:flutter/material.dart';
import 'package:recipe_demo/pages/startpage.dart';
import 'package:recipe_demo/utilities/onboardingmodel.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

List<OnBoardingModel> sliderData =[
  OnBoardingModel("assets/images/3.jpg", 'The First Title For You'),
  OnBoardingModel("assets/images/2.jpg", 'The Second Title For You'),
  OnBoardingModel("assets/images/1.jpg", 'The Third Title For You'),
];
class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}
class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  final pageIndexNotifier = ValueNotifier<int>(0);
  bool atEnd = false;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: PageView.builder(
            itemCount: sliderData.length,
            controller: _pageController,
            onPageChanged: (index) {
              pageIndexNotifier.value = index;
              if (index == (sliderData.length - 1)) {
                setState(() {
                  atEnd = true;
                  currentIndex = index;
                });
              } else {
                setState(() {
                  atEnd = false;
                  currentIndex = index;
                });
              }
            },
            itemBuilder: (context, index) {
              return Scaffold(
                backgroundColor: ToolsUtilities.mainColor,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    RaisedButton(onPressed: () {},
                        color: Colors.transparent,
                        elevation: 0,
                        child: atEnd ? InkWell(
                          onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartPage()));},
                          child: Text('Go To Home', style: TextStyle(
                              color: ToolsUtilities.whiteColor, fontSize: 20
                          ),),
                        )
                            : InkWell(
                          onTap:(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartPage()));},
                          child: Text('Skip', style: TextStyle(
                              color: ToolsUtilities.whiteColor, fontSize: 20
                          ),),
                        ))
                  ],
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _slideImage(),
                    _slideText(),
                    _drawDots()
                  ],
                ),
              );
            },),
        )
      ],
    );
  }
  Widget _slideImage() {
    return Container(
      width: 800,
      height: 350,
      decoration: BoxDecoration(
          color: ToolsUtilities.whiteColor ,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: ExactAssetImage(sliderData[currentIndex].image),
              fit: BoxFit.contain
          )
      ),
    );
  }
  Widget _slideText() {
    return
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text(sliderData[currentIndex].title, style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: ToolsUtilities.whiteColor
        ),
        ),
      );
  }
  Widget _drawDots() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: PageViewIndicator(
        pageIndexNotifier: pageIndexNotifier,
        length: sliderData.length,
        normalBuilder: (animationController, index) => Circle(
          size: 20,
          color: ToolsUtilities.whiteColor,
        ),
        highlightedBuilder: (animationController, index) => ScaleTransition(
          scale: CurvedAnimation(
            parent: animationController,
            curve: Curves.ease,
          ),
          child: Circle(
            size: 20,
            color:ToolsUtilities.secondColor,
          ),
        ),
      ),
    );
  }
}