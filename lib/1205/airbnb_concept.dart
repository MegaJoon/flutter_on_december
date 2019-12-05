import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/6680064-Airbnb-app-concept

class AirbnbConcept extends StatefulWidget {
  @override
  _AirbnbConceptState createState() => _AirbnbConceptState();
}

class _AirbnbConceptState extends State<AirbnbConcept> {
  Color _color = Color.fromRGBO(251, 129, 144, 1);

  double padding = 16.0;

  String _image = "https://cdn.pixabay.com/photo/2019/11/26/20/57/tatry-4655509__340.jpg";

  List<String> _imageList = [
    "https://cdn.pixabay.com/photo/2016/12/30/07/59/kitchen-1940174__340.jpg",
    "https://cdn.pixabay.com/photo/2016/06/24/10/47/architecture-1477041__340.jpg",
    "https://cdn.pixabay.com/photo/2017/03/22/17/39/kitchen-2165756__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/18/17/46/architecture-1836070__340.jpg",
    "https://cdn.pixabay.com/photo/2017/01/07/17/48/interior-1961070__340.jpg",
  ];

  String title = "airbnb";

  int currentIndex = 1;

  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // mainbox
            Positioned.fill(
              child: Column(
                children: <Widget>[
                  // appbar
                  Container(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width /2),
                    height: 48.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.airbnb, size: 32.0, color: _color),

                        SizedBox(width: 4.0),

                        Text(title,
                        style: TextStyle(
                          fontSize: 28.0, color: _color, fontWeight: FontWeight.bold,
                        ),
                        )
                      ],
                    ),
                  ),

                  // tabs
                  Container(
                    height: 40.0,
                    child: ListView(
                      padding: EdgeInsets.only(top : padding),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Text("Nearby Homes", style: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w600),),

                        SizedBox(width: padding),

                        Text("Featured homes", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),),

                        SizedBox(width: padding),

                        Text("Favorite homes", style: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),

                  // pageview
                  Flexible(
                    fit: FlexFit.tight,
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        itemCount: _imageList.length,
                        onPageChanged: (int _currentIndex){
                          setState(() {
                            currentIndex = _currentIndex;
                          });
                        },
                        itemBuilder: (context, index){
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: padding + padding * 3 * (currentIndex - index).abs()),
                            margin: EdgeInsets.symmetric(horizontal: padding),
                            child: Stack(
                              children: <Widget>[
                                // image
                                Positioned.fill(
                                    child: ClipPath(
                                      clipper: ImageClipper(),
                                      child: Container(
                                        padding: EdgeInsets.all(padding),
                                        margin: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16.0),
                                          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2)],
                                          image: DecorationImage(
                                            image: NetworkImage(_imageList[index]),
                                            fit: BoxFit.fill,
                                            colorFilter: (currentIndex - index).abs() == 0? null : ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstOut)
                                          ),
                                        ),

                                        child: Stack(
                                          children: <Widget>[
                                            // title
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("Beautiful Appartment\nNew York",
                                                  style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold, height: 1.5),
                                                  ),

                                                  Text("7 Roger Street.\nNew York, USA",
                                                    style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400, height: 1.5),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // beds & star
                                            Positioned(
                                              left: 0,
                                              right: 150.0,
                                              bottom: 0,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("3 Beds",
                                                    style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold, height: 5.0),
                                                  ),

                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Icon(Icons.star, size: 16.0, color: Colors.white),
                                                      Icon(Icons.star, size: 16.0, color: Colors.white),
                                                      Icon(Icons.star, size: 16.0, color: Colors.white),
                                                      Icon(Icons.star, size: 16.0, color: Colors.white),
                                                      Icon(Icons.star_border, size: 16.0, color: Colors.white),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // price
                                            Positioned(
                                              right: 0,
                                              bottom: 40.0,
                                              child: Container(
                                                height: 24.0,
                                                width: 60.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                    child: Text("\$155/p",
                                                    style: TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w400),
                                                    ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ),

                                // bottomRight text
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40.0,
                                    width: 140.0,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        // profile image
                                        Container(
                                          margin: EdgeInsets.only(right: padding /2),
                                          height: 32.0,
                                          width: 32.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(_image),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),

                                        // text
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text("Micheal", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),),
                                            Text("Niclson", style: TextStyle(fontSize: 12.0, color: Colors.black12, fontWeight: FontWeight.w400),)
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

                  // bottombar
                  Container(
                    margin: EdgeInsets.only(top: padding /2),
                    height: 80.0,
                    child: Stack(
                      children: <Widget>[
                        // container
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: ClipPath(
                            clipper: BottomClipper(),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: padding),
                              height: 64.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24.0),
                                  topRight: Radius.circular(24.0),
                                ),
                                color: Colors.black12,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Center(
                                      child: Icon(Icons.home, size: 40.0, color: _color),
                                    ),
                                  ),

                                  Flexible(
                                    child: Center(
                                      child: Icon(FontAwesomeIcons.newspaper, size: 40.0, color: Colors.grey),
                                    ),
                                  ),

                                  Flexible(
                                    child: Container(),
                                  ),

                                  Flexible(
                                    child: Center(
                                      child: Icon(Icons.settings, size: 40.0, color: Colors.grey),
                                    ),
                                  ),

                                  Flexible(
                                    child: Center(
                                      child: Icon(Icons.person_outline, size: 40.0, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // floating btn
                        Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width / 2 - 38.0,
                          right: MediaQuery.of(context).size.width / 2 - 38.0,
                          child: ClipPath(
                            clipper: MyClipper(),
                            child: Container(
                              alignment: Alignment.center,
                              height: 64.0,
                              decoration: BoxDecoration(
                                  color: _color,
                                  boxShadow: [BoxShadow(
                                      color: Colors.black12, spreadRadius: 1, blurRadius: 1)]),
                              child: Transform.rotate(
                                angle: -3.1,
                                child: Icon(FontAwesomeIcons.airbnb, size: 44.0, color: Colors.white),
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

            // topRight
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 48.0,
                width: MediaQuery.of(context).size.width /2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0)),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // name
                      Text("Christy Walkers", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),),

                      // profile
                      Container(
                        height: 48.0,
                        width: 48.0,
                        child: Stack(
                          children: <Widget>[
                            // profile image
                            Positioned(
                              top: 0,
                              right: 0,
                              bottom: 8.0,
                              child: Container(
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(_image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),

                            // badges
                            Positioned(
                              top: 12.0,
                              left: 0,
                              bottom: 0,
                              child: Container(
                                width: 24.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _color,
                                ),
                                child: Center(
                                  child: Text("3", style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),),
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
            ),
          ],
        ),
      ),
    );
  }
}

// BottomClipper
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width / 2 + 48.0, 0.0)
      ..quadraticBezierTo(size.width / 2 + 36.0, 3.0, size.width / 2 + 32.0, 12.0)
      ..lineTo(size.width / 2 + 20.0, size.height * 0.45)
      ..quadraticBezierTo(size.width / 2, size.height * 0.98, size.width / 2 - 20.0, size.height * 0.45)
      ..lineTo(size.width / 2 - 32.0, 12.0)
      ..quadraticBezierTo(size.width / 2 - 36.0, 3.0, size.width / 2 - 48.0, 0.0)
      ..lineTo(0.0, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// floating btn clipper
class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path()
      ..lineTo(28.0, 3.0)
      ..quadraticBezierTo(6.0, 6.0, 14.0, 24.0)
      ..lineTo(size.width / 2 - 12.0, size.height - 14.0)
      ..quadraticBezierTo(size.width / 2, size.height, size.width / 2 + 12.0, size.height - 14.0)
      ..lineTo(size.width - 12.0, 24.0)
      ..quadraticBezierTo(size.width - 6.0, 6.0, size.width - 28.0, 3.0)
      ..lineTo(28.0, 3.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

// imaeg clipper
class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
    ..lineTo(0.0, 0.0)
    ..lineTo(0.0, size.height)
    ..lineTo(size.width /2  - 12.0, size.height)
      ..quadraticBezierTo(size.width /2 - 1.0, size.height - 4.0, size.width /2, size.height - 12.0)
      ..lineTo(size.width /2, size.height - 28.0)
      ..quadraticBezierTo(size.width /2 + 1.0, size.height -36.0, size.width /2 + 16.0, size.height - 40.0)
    ..lineTo(size.width - 12.0, size.height - 40.0)
      ..quadraticBezierTo(size.width - 1.0, size.height - 44.0, size.width, size.height - 52.0)
    ..lineTo(size.width, 0.0)
    ..lineTo(0.0, 0.0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}