import 'package:flutter/material.dart';
import 'package:flutter_on_december/1212/character_list.dart';

// https://www.pinterest.co.kr/pin/379076493634664421/

class MovieCharachterUI extends StatefulWidget {
  @override
  _MovieCharachterUIState createState() => _MovieCharachterUIState();
}

class _MovieCharachterUIState extends State<MovieCharachterUI> {
  // double
  double padding = 16.0;

  // String
  String title = "Despicable Me";
  String title1 = "Characters";

  // pageview controller
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // appbar
            Container(
              height: 32.0,
              child: Row(
                children: <Widget>[
                  // left icon
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_back_ios, size: 24.0, color: Colors.black),
                  ),

                  Spacer(),

                  // right icon
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.search, size: 24.0, color: Colors.black),
                  ),
                ],
              ),
            ),

            // title
            Container(
              padding: EdgeInsets.only(top: padding, left: padding, right: padding),
              height: 100.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // text : title
                  Text(title,
                    style: TextStyle(
                      fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(title1,
                    style: TextStyle(
                      fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            // pageview
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.all(padding),
                        child: Stack(
                          children: <Widget>[
                            // background color
                            Positioned.fill(
                                child: ClipPath(
                                  clipper: MyClipper(),
                                  child: Container(
                                    padding: EdgeInsets.all(padding),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [characterList[index].color,
                                          characterList[index].color.withOpacity(0.80),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        // text : title
                                        Text(characterList[index].title,
                                          style: TextStyle(
                                            fontSize: 44.0, color: Colors.white, fontWeight: FontWeight.bold,
                                            height: 2.5,
                                          ),
                                        ),

                                        // text : click to read more
                                        Text("Click to Read more",
                                          style: TextStyle(
                                            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ),

                            // character image
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 100.0,
                              child: Image.asset(
                                  characterList[index].image,
                                  fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// background color container clipper
class MyClipper extends CustomClipper<Path> {
  double radiusCorner = 16.0;
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, size.height * 0.40 + radiusCorner)
      ..lineTo(0.0, size.height - radiusCorner)
      ..quadraticBezierTo(radiusCorner * 0.25, size.height - radiusCorner * 0.25, radiusCorner, size.height)
      ..lineTo(size.width - radiusCorner, size.height)
      ..quadraticBezierTo(size.width - radiusCorner * 0.25, size.height - radiusCorner * 0.25, size.width, size.height - radiusCorner)
      ..lineTo(size.width, size.height * 0.25 + radiusCorner)
      ..quadraticBezierTo(
          size.width - radiusCorner * 0.25, size.height * 0.25 + radiusCorner * 0.25,
          size.width - radiusCorner, size.height * 0.25 + radiusCorner * 0.20)

      ..lineTo(radiusCorner, size.height * 0.40)

      ..quadraticBezierTo(
          radiusCorner * 0.25, size.height * 0.40 + radiusCorner * 0.25,
          0.0, size.height * 0.40 + radiusCorner)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}












