import 'dart:math';

import 'package:flutter/material.dart';

// https://www.instagram.com/p/B37BnOHHPU3/?igshid=16jghhlmqsrmj

class SneakerApp extends StatefulWidget {
  @override
  _SneakerAppState createState() => _SneakerAppState();
}

class _SneakerAppState extends State<SneakerApp>
    with SingleTickerProviderStateMixin {
  // image list
  List<String> sneaker = [
    "assets/1219/image.png",
    "assets/1219/image.png",
    "assets/1219/image.png",
  ];
  
  // color list
  List<Color> colorList = [
    Color.fromRGBO(105, 135, 189, 1),
    Color.fromRGBO(247, 195, 168, 1),
    Color.fromRGBO(100, 182, 135, 1),
  ];
  // add to cart in container
  Color _bottomContainerColor = Color.fromRGBO(94, 207, 209, 1);

  // double
  double padding = 16.0;
  double radius = 24.0;

  // title
  String title = "Calvin Klein Sneaker";
  String price = "\$236";
  String description = "Trike 205 Churky Leather Sneakers";

  // bool isClosed
  bool isClosed = false;

  // index
  int currentIndex = 0;

  // animation
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    // animation
    _controller = AnimationController(
        duration: Duration(milliseconds: isClosed ? 500 : 800), vsync: this);
    animation = Tween<double>(begin: isClosed ? pi * 0.40 : 0.0, end: pi * 0.20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn, reverseCurve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isClosed = true;
          _controller.reverse();
        }
      });
    super.initState();
  }

  // set index
  void _onPressed(int num) {
    setState(() {
      // start animation
      _controller.forward();

      // change image
      currentIndex = num;
      isClosed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    double translateY = animation.value * 400.0;
    double rotateZ = animation.value;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.50,
            child: Stack(
              children: <Widget>[
                // background color container
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 3),
                    curve: Curves.fastOutSlowIn,
                    color: colorList[currentIndex],
//                    child: Placeholder(),
                  ),
                ),

                // sneaker image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(0.0, isClosed ? translateY : translateY, 0.0)
                      ..rotateZ(isClosed ? rotateZ : -animation.value),
                    alignment: FractionalOffset.bottomCenter,
                    child: Image.asset(
                      sneaker[currentIndex],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // left icon
                Positioned(
                  top: 0,
                  left: padding,
                  child: SafeArea(
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius /2),
                        color: Colors.black87,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios, size: 16.0, color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // right icon
                Positioned(
                  top: 0,
                  right: padding,
                  child: SafeArea(
                    child: Container(
                      height: 120.0 + padding *2,
                      width: 40.0,
                      child: Column(
                        children: <Widget>[
                          // text: 1
                          Container(
                            margin: EdgeInsets.only(bottom: padding),
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius /2),
                              color: Color.fromRGBO(238, 107, 86, 1),
                            ),
                            child: Center(
                              child: Text("1",
                                style: TextStyle(
                                  fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          // icon: bookmark
                          Container(
                            margin: EdgeInsets.only(bottom: padding),
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius /2),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.bookmark_border, size: 20.0, color: Colors.black,
                              ),
                            ),
                          ),

                          // icon: pass
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius /2),
                              color: Colors.grey.withOpacity(0.30),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.reply, size: 24.0, color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // bottom container
          Positioned(
            top: screenHeight * 0.45,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding * 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 4.0,
                    blurRadius: 4.0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // text: title
                  Text(title,
                    style: TextStyle(
                      fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                  ),

                  // text: price
                  Text(price,
                    style: TextStyle(
                      fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.bold,
                    ),
                  ),

                  // text: description
                  Text(description,
                    style: TextStyle(
                      fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400,
                    ),
                  ),

                  // set color
                  Container(
                    height: 64.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // text: Select Color
                        Text("Select Color",
                          style: TextStyle(
                            fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold,
                          ),
                        ),

                        // color container
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              width: 200.0,
                              child: ListView.builder(
                                  itemCount: colorList.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index){
                                    return InkWell(
                                      onTap: (){
                                        _onPressed(index);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: padding),
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(radius /2),
                                          color: colorList[index],
                                        ),
                                        child: currentIndex == index? Center(
                                          child: Icon(
                                              Icons.check, size: 24.0, color: Colors.white,
                                          ),
                                        ) : Container(),
                                      ),
                                    );
                                  }),
                            ),

                            Spacer(),

                            Text("More Info +",
                              style: TextStyle(
                                fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // select size / add to cart container
                  Container(
                    height: 48.0,
                    child: Row(
                      children: <Widget>[
                        // left container
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius /2),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey[300], width: 1.0),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  // text: Select Size
                                  Text("Select Size",
                                    style: TextStyle(
                                      fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // icon: arrow
                                  Icon(Icons.keyboard_arrow_down, size: 12.0, color: Colors.black,),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: padding),

                        // right container
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius /2),
                              color: _bottomContainerColor,
                            ),
                            // text: Select Size
                            child: Center(
                              child: Text("Add to Cart",
                                style: TextStyle(
                                  fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
