import 'package:flutter/material.dart';
import 'package:flutter_on_december/1202/blackberry_list.dart';
import 'package:flutter_on_december/1202/bottom_tabs.dart';
import 'package:flutter_on_december/1202/custom_tabs.dart';
import 'package:flutter_on_december/1202/second_blackberry.dart';

class BlackberryApp extends StatefulWidget {
  @override
  _BlackberryAppState createState() => _BlackberryAppState();
}

class _BlackberryAppState extends State<BlackberryApp> {
  List<Widget> pages;
  List<Widget> tabViewPages;

  double padding = 24.0;

  // color list
  Color _backgroundColor = Color.fromRGBO(32, 31, 45, 1);
  Color _bottomBarColor = Color.fromRGBO(14, 13, 19, 1);
  Color _bottomTabColor = Color.fromRGBO(68, 65, 78, 1);

  // bottom index
  int _currentIndex = 0;

  // bottom tab onClicked Function
  void _onPressed(int num){
    setState(() {
      _currentIndex = num;
    });
  }

  // tab index
  int _selectedIndex = 0;

  // tab onClicked Function
  void _onTap(int num){
    setState(() {
      _selectedIndex = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: <Widget>[
            // main box
            Flexible(
              fit: FlexFit.tight,
              child: pages[_currentIndex],
            ),

            // bottom bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
                ),
                color: _bottomBarColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomTabs(icon: Icons.home, text: "Home", isSelected: _currentIndex == 0, onPressed: (){_onPressed(0);},),
                  BottomTabs(icon: Icons.menu, text: "Menu", isSelected: _currentIndex == 1, onPressed: (){_onPressed(1);},),
                  BottomTabs(icon: Icons.search, text: "Search", isSelected: _currentIndex == 2, onPressed: (){_onPressed(2);},),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _definePages(){
    // tabview pages
    tabViewPages = [
      // initial page
      Padding(
        padding: EdgeInsets.only(top: padding),
        child: PageView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondBlackberry(index)));
                },
                child: Container(
                  margin: EdgeInsets.only(right: padding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(padding *1.5),
                    image: DecorationImage(
                      image: AssetImage(blackberryList[index].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      // discount container
                      Positioned(
                        top: padding,
                        left: padding,
                        child: Container(
                          height: 64.0,
                          width: 64.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(padding *0.50),
                            color: _backgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("30%",
                              style: TextStyle(
                                fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold,
                              ),
                              ),

                              Text("Discount",
                                style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // title, subtitle
                      Positioned(
                        left: padding,
                        bottom: padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(blackberryList[index].title,
                              style: TextStyle(
                                fontSize: 32.0, color: Colors.white, fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(blackberryList[index].subTitle,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),

      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.deepPurple),
    ];

    // main box pages
    pages = [
      // initial pages
      // appbar
      Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: <Widget>[
            // appbar
            Container(
              padding: EdgeInsets.only(bottom: padding),
              height: 150.0,
              child: Stack(
                children: <Widget>[
                  // title text
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Column(
                      children: <Widget>[
                        Text("Tonight", style: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold),),
                        Text("Monday, November 25", style: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),

                  // right container
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 64.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding * 0.50),
                        color: _bottomTabColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // 3 in circle container
                          Container(
                            height: 24.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _backgroundColor,
                            ),
                            child: Center(
                                child: Text("3",
                                  style: TextStyle(
                                    fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w600,
                                  ),
                                ),
                            ),
                          ),

                          // icon
                          Icon(Icons.shopping_cart, size: 20.0, color: Colors.white),

                          SizedBox(height: 8.0),
                          // price
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(alignment: Alignment.topCenter, child: Text("\$", style: TextStyle(fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w600),)),
                              Text("32", style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),

                          // total price
                          Text("Total Price",
                          style: TextStyle(
                            fontSize: 10.0, color: Colors.grey, fontWeight: FontWeight.w600,
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // tabbar
            Container(
              height: 64.0,
              child: Row(
                children: <Widget>[
                  CustomTab(text: "Promotion", isSelected: _selectedIndex == 0, onPressed: (){_onTap(0);},),
                  CustomTab(text: "Free Drink", isSelected: _selectedIndex == 1, onPressed: (){_onTap(1);},),
                  CustomTab(text: "Happy Hour", isSelected: _selectedIndex == 2, onPressed: (){_onTap(2);},),
                ],
              ),
            ),

            // tabbarView
            Flexible(
              fit: FlexFit.tight,
              child: tabViewPages[_selectedIndex],
            ),
          ],
        ),
      ),

      // dont use
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.indigo),
    ];
  }
}
