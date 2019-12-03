import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/4378613-Food-Delivery-App-Restaurants

class FoodDeliveryApp extends StatefulWidget {
  @override
  _FoodDeliveryAppState createState() => _FoodDeliveryAppState();
}

class _FoodDeliveryAppState extends State<FoodDeliveryApp> {
  double padding = 16.0;

  PageController _pageController;

  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex, viewportFraction: 0.90);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background circle amber container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 350.0,
                color: Colors.amber,
              ),
            ),
          ),

          // Column
          Positioned.fill(
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    // appbar
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      height: 64.0,
                      child: Row(
                        children: <Widget>[
                          // text column
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // title
                                Text("Delivery address",
                                style: TextStyle(
                                  fontSize: 16.0, color: Colors.black12, fontWeight: FontWeight.w600,
                                ),
                                ),

                                // name
                                Row(
                                  children: <Widget>[
                                    // name
                                    Text("Bielawska 12",
                                      style: TextStyle(
                                        fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(width: padding /2),

                                    // eidt icon
                                    Icon(Icons.edit, size: 20.0, color: Colors.black12),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // icon 1
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 4.0),
//                            height: 48.0,
                            width: 44.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2)],
                            ),
                            child: Center(
                                child: Icon(Icons.search, size: 28.0, color: Colors.black),
                            ),
                          ),

                          SizedBox(width: padding /2),

                          // icon 2
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 4.0),
//                            height: 48.0,
                            width: 44.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2)],
                            ),
                            child: Center(
                              child: Icon(Icons.person, size: 28.0, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // pageview
                    Container(
                      padding: EdgeInsets.only(top: padding),
                      height: 250.0,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: foodItem.length,
                          onPageChanged: (int currentIndex){
                            setState(() {
                              _currentIndex = currentIndex;
                            });
                          },
                          controller: _pageController,
                          itemBuilder: (context, index){
                            return Container(
                              padding: EdgeInsets.all(padding),
                              margin: EdgeInsets.only(right: padding, bottom: 2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                image: DecorationImage(
                                  image: NetworkImage(foodItem[index].image),
                                  fit: BoxFit.fill,
                                ),
                                boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2)],
                              ),
                              child: Stack(
                                children: <Widget>[
                                  // favorite icon
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Icon(Icons.favorite, size: 28.0, color: Colors.white),
                                  ),

                                  // container
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding /2),
                                      height: 85.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2)],
                                      ),

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          // title
                                          Text(foodItem[index].title,
                                          style: TextStyle(
                                            fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold,
                                          ),
                                          ),

                                          // subtitle
                                          Text(foodItem[index].subTitle,
                                            style: TextStyle(
                                              fontSize: 14.0, color: Colors.black12, fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          // divider
                                          Divider(color: Colors.black12),

                                          // icon
                                          Row(
                                            children: <Widget>[
                                              // score
                                              Icon(Icons.star, size: 16.0, color: Colors.amber),
                                              Text("4.9", style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),),
                                              Text("(284)", style: TextStyle(fontSize: 14.0, color: Colors.black12, fontWeight: FontWeight.bold),),

                                              Spacer(),

                                              // time
                                              Icon(Icons.watch_later, size: 16.0, color: Colors.black12),
                                              Text("15 ~ 25 mins", style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),),

                                              Spacer(),

                                              // tip
                                              Icon(Icons.check_circle_outline, size: 16.0, color: Colors.black12),
                                              Text("Free", style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),),

                                              Spacer(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),

                    // pageview indicator
                    Container(
                      height: 32.0,
                      child: DotsIndicator(
                        dotsCount: foodItem.length,
                        position: _currentIndex.toDouble(),
                        axis: Axis.horizontal,
                        decorator: DotsDecorator(
                          color: Colors.black12,
                          activeColor: Colors.black,
                          size: Size(6.0, 6.0),
                          activeSize: Size(8.0, 8.0),
                        ),
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: EdgeInsets.only(left: padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // tabs
                            Container(
                              height: 80.0,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index){
                                    return Container(
                                      margin: EdgeInsets.only(right: padding),
                                      width: 64.0,
                                      child: Column(
                                        children: <Widget>[
                                          // container
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Container(
                                              height: 64.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)]
                                              ),

                                              child: Center(
                                                  child: Icon(foodTabs[index].icon, size: 28.0, color: Colors.amber),
                                              ),
                                            ),
                                          ),

                                          SizedBox(height: 8.0),

                                          // text
                                          Text(foodTabs[index].text,
                                          style: TextStyle(
                                            fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600,
                                          ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),

                            // divider
                            Divider(color: Colors.black12, height: 24.0,),

                            // sorted
                            Container(
                              padding: EdgeInsets.only(right: padding),
                              height: 44.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  // text
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("All restaurants",
                                        style: TextStyle(
                                          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,
                                        ),
                                        ),

                                        Text("Sorted By Fastest Delivery",
                                          style: TextStyle(
                                            fontSize: 16.0, color: Colors.black12, fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // icon
                                  Container(
                                    height: 44.0,
                                    width: 44.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                    ),
                                    child: Center(
                                        child: Icon(Icons.subject, size: 28.0, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(padding),
                              margin: EdgeInsets.only(top: padding, right: padding),
                              height: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            // title
                                            Text("The Tang NYC",
                                              style: TextStyle(
                                                fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            // subtitle
                                            Text("Asian, Noodles",
                                              style: TextStyle(
                                                fontSize: 14.0, color: Colors.black12, fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // sign
                                      Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.red, width: 1.5),
                                        ),
                                        child: Center(
                                            child: Text("印",
                                            style: TextStyle(
                                              fontSize: 20.0, color: Colors.red, fontWeight: FontWeight.w600,
                                            ),
                                            ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // divider
                                  Divider(color: Colors.black12),

                                  // icon
                                  Row(
                                    children: <Widget>[
                                      // score
                                      Icon(Icons.star, size: 16.0, color: Colors.amber),
                                      Text("4.9", style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),),
                                      Text("(284)", style: TextStyle(fontSize: 14.0, color: Colors.black12, fontWeight: FontWeight.bold),),

                                      Spacer(),

                                      // time
                                      Icon(Icons.watch_later, size: 16.0, color: Colors.black12),
                                      Text("15 ~ 25 mins", style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),),

                                      Spacer(),

                                      // tip
                                      Icon(Icons.check_circle_outline, size: 16.0, color: Colors.black12),
                                      Text("Free over \$20", style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),),

                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

// custom clipper : circle shape
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path()
    ..lineTo(0.0, size.height * 0.70)
    ..quadraticBezierTo(size.width * 0.50, size.height, size.width, size.height * 0.70)
    ..lineTo(size.width, 0.0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FoodItem {
  String image;
  String title;
  String subTitle;

  FoodItem({this.image, this.title, this.subTitle});
}

List<FoodItem> foodItem = [
  FoodItem(image : "https://cdn.pixabay.com/photo/2016/02/19/11/30/pizza-1209748__340.jpg", title: "Nickel & Dinner", subTitle: "American (Traditional), Breakfast"),
  FoodItem(image : "https://cdn.pixabay.com/photo/2016/02/19/11/30/shrimp-1209744__340.jpg", title: "Nickel & Dinner", subTitle: "American (Traditional), Breakfast"),
  FoodItem(image : "https://cdn.pixabay.com/photo/2016/11/23/13/45/blur-1852926__340.jpg", title: "Nickel & Dinner", subTitle: "American (Traditional), Breakfast"),
];

class FoodTabs {
  IconData icon;
  String text;

  FoodTabs({this.icon, this.text});
}

List<FoodTabs> foodTabs = [
  FoodTabs(icon: FontAwesomeIcons.drumstickBite, text: "American"),
  FoodTabs(icon: FontAwesomeIcons.egg, text: "Asian"),
  FoodTabs(icon: FontAwesomeIcons.pizzaSlice, text: "Breakfast"),
  FoodTabs(icon: FontAwesomeIcons.chessQueen, text: "Burgers"),
  FoodTabs(icon: FontAwesomeIcons.mousePointer, text: "Cafe"),
];












