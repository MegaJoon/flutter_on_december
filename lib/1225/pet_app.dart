import 'package:flutter/material.dart';
import 'package:flutter_on_december/1225/pet_bottom_tabs.dart';

// https://www.instagram.com/p/B6M70wqIqIt/

class PetApp extends StatefulWidget {
  @override
  _PetAppState createState() => _PetAppState();
}

class _PetAppState extends State<PetApp> {
  // List<image>
  List<String> puppy = [
    "https://cdn.pixabay.com/photo/2016/11/01/23/38/bandana-1790048_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/03/29/09/59/cat-2184682_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/06/25/18/22/puppy-4298756_960_720.jpg",
  ];

  // double
  double bottomHeight = 80.0;
  double btnWidth = 56.0;
  double padding = 16.0;
  double radius = 24.0;

  // color
  Color _bottomColor = Colors.grey[200];
  Color _backgroundColor = Color.fromRGBO(109, 182, 171, 1);
  Color _highlightColor = Color.fromRGBO(82, 147, 144, 1);
  Color _bottomHighlightColor = Color.fromRGBO(57, 105, 111, 1);

  // bottom index
  int currentIndex = 3;

  // bottom tabs Function
  void _onPressed(int num){
    setState(() {
      currentIndex = num;
    });
  }

  // pageview controller
  PageController _pageController;

  // pageview index
  int selectedIndex = 0;

  // now page
  bool nowPage;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: selectedIndex,
        viewportFraction: 0.60,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bottomColor,
      body: Stack(
        children: <Widget>[
          // top container
          Positioned(
            top: 0,
            left: padding * 4,
            right: 0,
            bottom: bottomHeight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius *2),
                ),
                color: _backgroundColor,
              ),
//              child: Placeholder(),
            ),
          ),

          // appbar
          Positioned(
            top: btnWidth,
            left: padding * 4 - btnWidth / 2,
            right: padding,
            child: Container(
              height: btnWidth,
              child: Row(
                children: <Widget>[
                  // left: floating btn
                  Container(
                    height: btnWidth,
                    width: btnWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 2.0,
                        offset: Offset(2.0, 2.0),
                      )],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.home,
                        size: 28.0,
                        color: _highlightColor,
                      ),
                    ),
                  ),

                  // spacer
                  Spacer(),

                  // right: textfield
                  Container(
                    height: btnWidth * 0.80,
                    width: 150.0,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8.0),

                        // prefixIcon
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20.0,
                          color: _highlightColor,
                        ),

                        // hint
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // tabs
          Positioned(
            top: 140.0,
            left: padding * 4 + padding *2,
            right: padding,
            child: Container(
              height: 40.0,
              child: Row(
                children: <Widget>[
                  // text: All
                  Container(
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius /2),
                      color: _highlightColor,
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1.0,
                        blurRadius: 1.0,
                        offset: Offset(1.0, 1.0),
                      )],
                    ),
                    child: Center(
                      child: Text("All",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),

                  // text: Dogs
                  Container(
                    width: 80.0,
                    child: Center(
                      child: Text("Dogs",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),

                  // text: Cats
                  Container(
                    width: 80.0,
                    child: Center(
                      child: Text("Cats",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // pageview
          Positioned(
            top: 230.0,
            left: 0,
            right: 0,
            child: Container(
              height: 300.0,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: puppy.length,
                  controller: _pageController,
                  onPageChanged: (int _selectedIndex){
                    setState(() {
                      selectedIndex = _selectedIndex;
                    });
                  },
                  itemBuilder: (context, index){
                    nowPage = selectedIndex == index? true : false;

                    return Transform.translate(
                      offset: Offset(-padding *3, 0.0),
                      child: Container(
//                        padding: EdgeInsets.all(padding /2),
                        margin: EdgeInsets.only(right: padding *2, bottom: 1.0),

                        child: Stack(
                          children: <Widget>[
                            // background container
                            Positioned.fill(
                              child: AnimatedCrossFade(
                                duration: Duration(milliseconds: 300),
                                firstCurve: Curves.fastOutSlowIn,
                                secondCurve: Curves.fastOutSlowIn,
                                firstChild: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(radius),
                                   color: Colors.white,
                                   boxShadow: [BoxShadow(
                                     color: Colors.black12,
                                     spreadRadius: 1.0,
                                     blurRadius: 1.0,
                                     offset: Offset(1.0, 1.0),
                                   )],
                                 ),
                               ),
                                secondChild: Container(),
                                crossFadeState: nowPage? CrossFadeState.showFirst : CrossFadeState.showSecond,
                              ),
                            ),

                            // image
                            Positioned(
                              top: padding /2,
                              left: padding /2,
                              right: padding /2,
                              child: Container(
                                height: 190.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radius /2),
                                  image: DecorationImage(
                                    image: NetworkImage(puppy[index]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),

                            // icon
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: padding /2,
                              child: nowPage? Container(
                                height: 100.0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: padding /2),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // left icon
                                      Icon(
                                        Icons.shuffle,
                                        size: 16.0,
                                        color: Colors.grey[400],
                                      ),

                                      // center icon
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Icon(
                                          Icons.favorite,
                                          size: 40.0,
                                          color: _bottomHighlightColor,
                                        ),
                                      ),

                                      // right icon
                                      Icon(
                                        Icons.wrap_text,
                                        size: 16.0,
                                        color: Colors.grey[400],
                                      ),
                                    ],
                                  ),
                                ),
                              ) : Container(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),

          // bottom container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(padding),
              height: bottomHeight,
              color: _bottomColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  PetsBottomTabs(
                    icon: Icons.notifications,
                    text: "Noti",
                    isSelected: currentIndex == 0,
                    onPressed: (){
                      _onPressed(0);
                    },
                  ),

                  PetsBottomTabs(
                    icon: Icons.lightbulb_outline,
                    text: "Light",
                    isSelected: currentIndex == 1,
                    onPressed: (){
                      _onPressed(1);
                    },
                  ),

                  PetsBottomTabs(
                    icon: Icons.favorite,
                    text: "Favorite",
                    isSelected: currentIndex == 2,
                    onPressed: (){
                      _onPressed(2);
                    },
                  ),

                  PetsBottomTabs(
                    icon: Icons.explore,
                    text: "Explore",
                    isSelected: currentIndex == 3,
                    onPressed: (){
                      _onPressed(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
