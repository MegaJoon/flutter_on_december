import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_on_december/1209/movie_list.dart';

class BookPage extends StatefulWidget {
  final int index;

  BookPage(this.index);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  // double
  double padding = 16.0;
  double radius = 24.0;

  // scroll
  double positionY = 410.0;

  // full scroll state signal
  bool isFullScrolled = false;

  String description =
      "Joker is a 2019 American psychological thriller film directed by Todd Phillips, who co-wrote the screenplay with Scott Silver.";
  String description1 =
      "The film, based on DC Comics characters, stars Joaquin Phoenix as the Joker. An origin story set in 1981. the film follows Arthur Fleck, a mentally ill failed stand-up comedian who turns to a life of crime in Gotham City.";
  String description2 =
      "Robert De Niro, Zazie Beetz, Frances Controy, Brett Cullen, Glenn Fleshier, Forever alone in a crowd, failed conmedian Arthur Fleck walks the streets of Gotham City. Arthur wears two masks - the one he paints for his day job as a clown, and the guise he projects";

  @override
  Widget build(BuildContext context) {
    // device screen height
    final screenHeight = MediaQuery.of(context).size.height;

    // device screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // max position
    double maxPositionY = screenHeight - 80.0;

    // minimun position
    double minimumPositionY = screenHeight * 0.60;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.35,
            // use hero widget
            child: Hero(
              tag: "movie ${widget.index}",
              child: Image.asset(
                movieList[widget.index].image,
                fit: BoxFit.fill,
              ),
            ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: padding / 2,
            right: padding / 2,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 64.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // left icon
                    IconButton(
                      onPressed: () {
                        // back
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: 28.0, color: Colors.white),
                    ),

                    isFullScrolled
                        ? Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // spacer
                                Container(height: 28.0, width: 52.0),

                                // column text
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // title
                                      Text(
                                        movieList[widget.index].title,
                                        style: TextStyle(
                                          fontSize: 28.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // runtime
                                      Text(
                                        "Runtime: 122 minutes",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // icon
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.play_circle_outline, size: 28.0, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        : Spacer(),

                    // right icon
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_border, size: 28.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // white bottom container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragStart: (DragStartDetails dragDetails) {},
              onVerticalDragUpdate: (DragUpdateDetails dragDetails) {
                setState(() {
                  positionY -= dragDetails.delta.dy;

                  if (positionY > maxPositionY) positionY = maxPositionY;
                  if (positionY < minimumPositionY) positionY = minimumPositionY;

                  print("positionY = $positionY");

                  if (positionY == maxPositionY)
                    isFullScrolled = true;
                  else
                    isFullScrolled = false;
                });
              },
              onVerticalDragEnd: (DragEndDetails dragDetails) {
                setState(() {
                  if (positionY >= minimumPositionY + (maxPositionY - minimumPositionY) / 2)
                    positionY = maxPositionY;
                  else
                    positionY = minimumPositionY;

                  if (positionY == maxPositionY)
                    isFullScrolled = true;
                  else
                    isFullScrolled = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.fastOutSlowIn,
                height: positionY,
                child: Stack(
                  children: <Widget>[
                    // bottom white container
                    Positioned(
                      top: 32.0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.only(top: padding * 2, left: padding, bottom: padding * 2),
                        height: maxPositionY + 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius),
                            topRight: Radius.circular(radius),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // movie title
                            isFullScrolled
                                ? Container()
                                : Container(
                              margin: EdgeInsets.only(bottom: padding),
                              height: 100.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // title
                                  Text(
                                    movieList[widget.index].title,
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // genre
                                  Text(
                                    movieList[widget.index].genre,
                                    style: TextStyle(fontSize: 14.0, color: Colors.grey[500], fontWeight: FontWeight.w600, height: 1.5),
                                  ),

                                  // runtime
                                  Text(
                                    "Runtime: 2h 2min",
                                    style: TextStyle(fontSize: 14.0, color: Colors.grey[500], fontWeight: FontWeight.w600, height: 1.5),
                                  ),
                                ],
                              ),
                            ),

                            // description
                            Container(
                              padding: EdgeInsets.only(right: padding *2),
                              height: 150.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // description
                                  Text(
                                    description,
                                    style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600, height: 1.5),
                                  ),
                                  Text(
                                    description1,
                                    style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600, height: 1.5),
                                  ),
                                ],
                              ),
                            ),

                            // image list
                            Container(
                              height: 180.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(vertical: padding),
                                children: <Widget>[
                                  // list 1
                                  Container(
                                    margin: EdgeInsets.only(right: padding),
                                    height: 150.0,
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            movieList[widget.index].subImage[0].image),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(2.0, 2.0),
                                      )],
                                    ),
//                                    child: Placeholder(),
                                  ),

                                  // list 2
                                  Container(
                                    margin: EdgeInsets.only(right: padding),
                                    height: 150.0,
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            movieList[widget.index].subImage[0].image1),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(2.0, 2.0),
                                      )],
                                    ),
//                                    child: Placeholder(),
                                  ),

                                  // list 3
                                  Container(
                                    margin: EdgeInsets.only(right: padding),
                                    height: 150.0,
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            movieList[widget.index].subImage[0].image2),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(2.0, 2.0),
                                      )],
                                    ),
//                                    child: Placeholder(),
                                  ),
                                ],
                              ),
                            ),

                            // description 2
                            Padding(
                              padding: EdgeInsets.only(right: padding),
                              child: Text(
                                description2,
                                style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600, height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // center floating btn
                    isFullScrolled? Positioned(
                      top: 42.0,
                      left: screenWidth /2 - 24.0,
                      right: screenWidth /2 - 24.0,
                      child: Container(
                        height: 4.0,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: Colors.grey[300],
                        ),
                      ),
                    ) : AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      top: 0,
                      left: screenWidth / 2 - 32.0,
                      right: screenWidth / 2 - 32.0,
                      child: Container(
                        height: isFullScrolled ? 0.0 : 64.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 4,
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: isFullScrolled? Container() : Center(
                          child: Icon(
                            Icons.arrow_right,
                            size: 64.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // bottom : buy ticket
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: padding * 2.5,  left: padding, right: padding, bottom: padding),
              height: 105.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.5), Colors.white, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: <Widget>[
                  // buy ticket container
                  Flexible(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius /2),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text("Buy Ticket".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: padding *2),

                  // circlualr progress
                  Flexible(
                    child: Stack(
                      children: <Widget>[
                        // circular chart
                        Positioned.fill(
                          child: Center(
                            child: CustomPaint(
                              painter: ChartPaint(),
                            ),
                          ),
                        ),

                        // center text
                        Positioned.fill(
                          child: Center(
                            child: Text("9.1",
                              style: TextStyle(
                                fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
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

class ChartPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(center: Offset(0.0, 0.0), radius: 16.0);
    double startAngle = - pi /2;
    double sweepAngle = pi * 2 * 0.91;

    var paint = Paint()
    ..color = Colors.black
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}