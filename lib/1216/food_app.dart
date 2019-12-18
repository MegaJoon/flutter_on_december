import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_on_december/1216/food_list.dart';
import 'package:flutter_on_december/1216/food_tabs.dart';
import 'package:flutter_on_december/1216/shopping_cart_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://www.instagram.com/p/B447YpOnfuf/?igshid=1u5qytb1rlrkk

class FoodApp extends StatefulWidget {
  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> with SingleTickerProviderStateMixin {
  // double
  double padding = 16.0;
  double radius = 24.0;

  // animation
  AnimationController _controller;
  Animation<double> animation;

  // pagecontroller
  PageController _pageController;

  // pageview index
  int _currentIndex = 0;

  // now index page
  bool nowPage;

  @override
  void initState() {
    // pageview controller
    _pageController = PageController(initialPage: _currentIndex, viewportFraction: 0.70);

    // animation
    _controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation = Tween<double>(begin: 0.0, end: pi * 0.75).animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn, reverseCurve: Curves.fastOutSlowIn))
      ..addListener((){
        setState(() {
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: Colors.grey[200],

      // body
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // textfield
            Container(
              margin: EdgeInsets.all(padding),
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                )],
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(5.0),

                  // icon
                  prefixIcon: Icon(Icons.search, size: 20.0, color: Colors.grey),

                  // hint
                  hintText: "Search for your favorite food",
                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
            ),

            // text
            Padding(
              padding: EdgeInsets.only(left: padding),
              child: Text("Restaurants",
                style: TextStyle(
                  fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // tabbar
            Container(
              height: 64.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: padding /2, bottom: 2.0),
                children: <Widget>[
                  FoodTabs(icon: FontAwesomeIcons.stroopwafel, text: "Tag 1", isSelected: true, onPressed: (){},),
                  FoodTabs(icon: FontAwesomeIcons.hamburger, text: "Tag 2", isSelected: false, onPressed: (){},),
                  FoodTabs(icon: FontAwesomeIcons.hotdog, text: "Tag 3", isSelected: false, onPressed: (){},),
                  FoodTabs(icon: FontAwesomeIcons.pizzaSlice, text: "Tag 4", isSelected: false, onPressed: (){},),
                  FoodTabs(icon: FontAwesomeIcons.iceCream, text: "Tag 5", isSelected: false, onPressed: (){},),
                  FoodTabs(icon: FontAwesomeIcons.birthdayCake, text: "Tag 6", isSelected: false, onPressed: (){},),
                ],
              ),
            ),

            // text
            Padding(
              padding: EdgeInsets.only(top: padding, left: padding),
              child: RichText(text: TextSpan(children: [
                TextSpan(text: "Most\n",
                  style: TextStyle(
                    fontSize: 28.0, color: Colors.black54, fontWeight: FontWeight.bold,
                  ),
                ),

                TextSpan(text: "Popular Food",
                  style: TextStyle(
                    fontSize: 28.0, color: Colors.grey, fontWeight: FontWeight.w600,
                  ),
                ),
              ]),),
            ),

            // pageview
            Flexible(
              fit: FlexFit.tight,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: foodList.length,
                  onPageChanged: (int currentIndex){
                    setState(() {
                      _currentIndex - currentIndex > 0?
                      _controller.reverse() : _controller.forward();

//                      print("_currentIndex = $_currentIndex");
//                      print("currentIndex = $currentIndex");

                      _currentIndex = currentIndex;
                    });
                  },
                  itemBuilder: (context, index){
                    _currentIndex == index? nowPage = true : nowPage = false;

                    return GestureDetector(
                      onTap: (){
                        // move next page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCartPage(index)));
                      },

                      child: Transform.translate(
                        offset: Offset(-padding * 2.8, 0.0),
                        child: Container(
                          padding: EdgeInsets.only(right: padding *2),
                          child: Stack(
                            children: <Widget>[
                              // background
                              Positioned(
                                top: 80.0,
                                left: 0,
                                right: 0,
                                bottom: nowPage? 8.0: padding + 8.0,
                                child: Hero(
                                  tag: "background $index",
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: nowPage? 64.0 : 120.0,
                                        left: padding,
                                        right: padding,
                                        bottom: nowPage? padding : padding *3,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius),
                                      color: foodList[index].color,
                                      boxShadow: [BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 4.0,
                                        blurRadius: 8.0,
                                      )],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // icon : score
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.star, size: 8.0, color: Colors.white),
                                            Icon(Icons.star, size: 8.0, color: Colors.white),
                                            Icon(Icons.star, size: 8.0, color: Colors.white),
                                            Icon(Icons.star, size: 8.0, color: Colors.white),
                                            Icon(Icons.star, size: 8.0, color: Colors.grey),
                                          ],
                                        ),

                                        SizedBox(height: padding /2),

                                        // text : title
                                        Text(foodList[index].title,
                                          style: TextStyle(
                                            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        Spacer(),

                                        // text : description
                                        nowPage? Text(foodList[index].description,
                                          style: TextStyle(
                                            fontSize: 12.0, color: Colors.white30, fontWeight: FontWeight.w400,
                                          ),
                                        ) : Container(),

                                        // text : price
                                        Text(foodList[index].price,
                                          style: TextStyle(
                                            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        // container
                                        nowPage? Container(
                                          margin: EdgeInsets.only(top: padding),
                                          alignment: Alignment.centerRight,
                                          height: 40.0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: padding /2),
                                            height: 40.0,
                                            width: 120.0,
                                            decoration: ShapeDecoration(
                                              shape: StadiumBorder(),
                                              color: Colors.white,
                                              shadows: [BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 1.0,
                                                blurRadius: 1.0,
                                              )],
                                            ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Icon(Icons.add_photo_alternate, size: 16.0, color: Colors.grey),

                                                Text("Add to cart",
                                                  style: TextStyle(
                                                    fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ) : Container(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // image
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn,
                                top: nowPage? 0 : 48.0,
                                left: 0,
                                right: 0,
                                child: Hero(
                                  tag: "image $index",
                                  child: Transform.rotate(
                                    angle: nowPage? animation.value : 0.0,
                                    child: Image.asset(
                                        foodList[index].image,
                                        fit: BoxFit.contain,
                                      height: nowPage? 150.0 : 100.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            // bottom bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: padding * 4),
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius *1.5),
                  topRight: Radius.circular(radius *1.5),
                ),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2.0,
                  blurRadius: 4.0,
                )],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu, size: 28.0, color: Colors.black54),
                  Icon(Icons.home, size: 28.0, color: Colors.black54),
                  Icon(Icons.person_outline, size: 28.0, color: Colors.black54),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
