import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_on_december/1230/card_widget.dart';
import 'package:flutter_on_december/1230/items_list.dart';

// https://dribbble.com/shots/9177633-Solar-system-UI

class SolarSystemUI extends StatefulWidget {
  @override
  _SolarSystemUIState createState() => _SolarSystemUIState();
}

class _SolarSystemUIState extends State<SolarSystemUI> {
  // image
  String _backgroundImage = "assets/1230/image.jpg";

  // text
  String title = "Solar system";

  // double
  double padding = 16.0;
  double radius = 20.0;

  // color
  Color _boxColor = Colors.grey[900];
  Color _iconColor = Color.fromRGBO(192, 182, 99, 1);

  // PageView
  PageController _pageController;
  double currentIndex = items.length - 1.0;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex.toInt())
    ..addListener((){
      setState(() {
        currentIndex = _pageController.page;
        print("currentIndex = $currentIndex");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background image
          Positioned.fill(
            child: Image.asset(
                _backgroundImage,
                fit: BoxFit.fill,
            ),
          ),

          // appbar
          Positioned(
            top: padding,
            left: 0,
            right: 0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),

                    // text: title
                    Text(title,
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Center PageView
          Positioned(
            top: 100.0,
            left: 0,
            right: 0,
            bottom: 150.0,
            child: Container(
              height: 400.0,
              child: Stack(
                children: <Widget>[
                  // main
                  CardWidget(currentIndex),

                  // PageView
                  Positioned.fill(
                      child: PageView.builder(
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          reverse: true,
                          itemBuilder: (context, index){
                            return Container(
                              margin: EdgeInsets.only(
                                left: 180.0,
                                right: 40.0,
                                bottom: 250.0,
                              ),
                              child: Image.asset(
                                  items[currentIndex.round()].image,
                              fit: BoxFit.fill,
                              ),
                            );
                          }),
                  ),
                ],
              ),
            ),
          ),

          // dots indicator
          Positioned(
            left: 0,
            right: 0,
            bottom: 90.0,
            child: Container(
              height: 32.0,
              child: Center(
                child: DotsIndicator(
                  dotsCount: items.length,
                  position: currentIndex,
                  axis: Axis.horizontal,
                  decorator: DotsDecorator(
                    color: Colors.grey[600].withOpacity(0.50),
                    activeColor: Colors.brown.withOpacity(0.50),
                    activeShape: StadiumBorder(),
                    size: Size(8.0, 8.0),
                    activeSize: Size(16.0, 8.0),
                    spacing: EdgeInsets.all(4.0),
                  ),
                ),
              ),
            ),
          ),

          // bottom bar
          Positioned(
            left: padding,
            right: padding,
            bottom: padding /2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding /2),
              height: 72.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: _boxColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 64.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.alternate_email,
                          size: 28.0,
                          color: _iconColor,
                        ),

                        Text("Explore",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: _iconColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 64.0,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        size: 28.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Container(
                    width: 64.0,
                    child: Center(
                      child: Icon(
                        Icons.bookmark_border,
                        size: 28.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Container(
                    width: 64.0,
                    child: Center(
                      child: Icon(
                        Icons.alternate_email,
                        size: 28.0,
                        color: Colors.grey,
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
