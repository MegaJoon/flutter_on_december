import 'dart:math';

import 'package:flutter/material.dart';

// https://dribbble.com/shots/6464987-Nike-SNKRS-App-Redesign-Concept

class NikeApp extends StatefulWidget {
  @override
  _NikeAppState createState() => _NikeAppState();
}

class _NikeAppState extends State<NikeApp> {
  // color list
  Color _backgroundColor = Color.fromRGBO(60, 240, 159, 1);
  Color _blackColor = Color.fromRGBO(45, 45, 45, 1);

  // double
  double padding = 16.0;
  double radius = 40.0;

  // String
  String _logoImage = "assets/1217/icon.png";
  String _image = "assets/1217/image.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: _backgroundColor,

      // main body
      body: Stack(
        children: <Widget>[
          // bottom menu icon
          Positioned(
            left: 0,
            right: 0,
            bottom: 12.0,
            child: Icon(Icons.menu, size: 32.0, color: Colors.black),
          ),

          // black container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 52.0,
            child: Container(
              padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
                color: _blackColor,
              ),
              child: SafeArea(
                top: true,
                left: true,
                right: true,
                child: Column(
                  children: <Widget>[
                    // appbar
                    Container(
                      height: 40.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // left icon
                          Icon(Icons.list, size: 32.0, color: Colors.grey,),

                          // center nike logo
                          Container(
//                            height: 40.0,
                            width: 80.0,
                            child: Image.asset(
                                _logoImage,
                                color: Colors.white,
                                fit: BoxFit.cover,
                            ),
                          ),

                          // right icon
                          Icon(Icons.search, size: 32.0, color: Colors.grey,)
                        ],
                      ),
                    ),

                    Spacer(),

                    // score & price
                    Container(
                      height: 52.0,
                      child: Row(
                        children: <Widget>[
                          // score
                          Icon(Icons.star_border, size: 20.0, color: Colors.amber,),
                          Icon(Icons.star_border, size: 20.0, color: Colors.amber,),
                          Icon(Icons.star_border, size: 20.0, color: Colors.amber,),
                          Icon(Icons.star_border, size: 20.0, color: Colors.amber,),
                          Icon(Icons.star_border, size: 20.0, color: Colors.grey,),

                          Spacer(),

                          // price
                          RichText(
                            text: TextSpan(
                              children: [
                                // text: EUR
                                TextSpan(text: "EUR ".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                // text: 125.90
                                TextSpan(text: "125.90",
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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

          // white container
          Positioned(
            top: 72.0,
            left: 0,
            right: 0,
            bottom: 150.0,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 4.0,
                    blurRadius: 4.0,
                  )],
                ),
                child: Column(
                  children: <Widget>[
                    // title
                    Container(
                      height: 64.0,
                      child: Row(
                        children: <Widget>[
                          // text: title
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // text: Nike
                                Text("Nike".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // text: title
                                Text("React Element 55",
                                  style: TextStyle(
                                    fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // text: subTitle
                                Text("Premium Laser Fuchsia",
                                  style: TextStyle(
                                    fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // icon shopping cart
                          Container(
                            width: 52.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 1.0),
                              color: Colors.white,
                            ),
                            child: Stack(
                              children: <Widget>[
                                // center icon
                                Positioned.fill(
                                    child: Center(
                                      child: Icon(Icons.shopping_cart, size: 20.0, color: Colors.black,),
                                    ),
                                ),

                                // badge
                                Positioned(
                                  top: 0,
                                  right: 2.0,
                                  child: Container(
                                    height: 18.0,
                                    width: 18.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _backgroundColor,
                                    ),
                                    child: Center(
                                      child: Text("2",
                                        style: TextStyle(
                                          fontSize: 10.0, color: Colors.black, fontWeight: FontWeight.bold,
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

                    // image
                    Flexible(
                      fit: FlexFit.tight,
                      child: Stack(
                        children: <Widget>[
                          // topLeft icon
                          Positioned(
                            top: padding,
                            left: padding,
                            child: Icon(
                              Icons.favorite_border,
                              size: 24.0,
                              color: Colors.grey,
                            ),
                          ),

                          // topRight icon
                          Positioned(
                            top: padding,
                            right: padding,
                            child: Icon(
                              Icons.share,
                              size: 24.0,
                              color: Colors.grey,
                            ),
                          ),

                          // center grey circle container
                          Positioned(
                            top: padding,
                            left: padding,
                            right: padding,
                            bottom: padding,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                                boxShadow: [BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                )],
                              ),
                            ),
                          ),

                          // center image
                          Positioned(
                            top: -padding *3,
                            left: padding,
                            right: padding,
                            bottom: padding,
                            child: Transform.rotate(
                              angle: -0.40,
                              child: Image.asset(_image,
                              fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // bottom
                    Container(
                      height: 88.0,
                      child: Row(
                        children: <Widget>[
                          // color, size
                          Row(
                            children: <Widget>[
                              // color
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // text: color
                                  Text("color",
                                    style: TextStyle(
                                      fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  // draw circle container
                                  Container(
                                    height: 48.0,
                                    width: 48.0,
                                    child: CustomPaint(
                                      painter: ColorPaint(),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(width: 12.0),

                              // size
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // text: size
                                  Text("size",
                                    style: TextStyle(
                                      fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  // draw circle container
                                  Container(
                                    height: 48.0,
                                    width: 48.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text("47",
                                        style: TextStyle(
                                          fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(width: 12.0),

                              // icon
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.more_horiz,
                                    size: 20.0,
                                    color: Colors.black,
                                  ),

                                  SizedBox(height: 12.0),
                                ],
                              )
                            ],
                          ),

                          Spacer(),

                          // icon in container
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // - icon
                              Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey, width: 1.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    size: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              // tune icon
                              Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey, width: 1.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Transform.rotate(
                                    angle: 1.56,
                                      child: Icon(
                                        Icons.tune,
                                        size: 20.0,
                                        color: Colors.black,
                                      ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // floating btn
          Positioned(
            right: 2 * radius - 3.0,
            bottom: 150.0,
            child: Container(
              height: 62.0,
              width: 62.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _backgroundColor,
              ),
              child: Center(
                child: Icon(Icons.add, size: 32.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// clipper
class MyClipper extends CustomClipper<Path> {
  // double radius
  double radius = 36.0;

  @override
  Path getClip(Size size) {
    var path = Path()
        ..lineTo(0.0, 0.0)
        ..lineTo(0.0, size.height)
        ..lineTo(size.width - radius * 5.0, size.height)

      ..quadraticBezierTo(
          size.width - radius * 4.10,
          size.height - radius * 0.10,
          size.width - radius * 4.00,
          size.height - radius)

      ..quadraticBezierTo(
          size.width - radius * 3.90,
          size.height - radius * 1.82,
          size.width - radius * 3.00,
          size.height - radius * 1.90)

      ..quadraticBezierTo(
          size.width - radius * 2.10,
          size.height - radius * 1.82,
          size.width - radius * 2.00,
          size.height - radius)

      ..quadraticBezierTo(
          size.width - radius * 1.90,
          size.height - radius * 0.10,
          size.width - radius,
          size.height)

        ..lineTo(size.width, size.height)
        ..lineTo(size.width, 0.0)
        ..lineTo(0.0, 0.0)
        ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// custom paint circle contaienr draw paint
class ColorPaint extends CustomPainter {
  double radius = 16.0;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(center: Offset(radius * 1.5, radius * 1.5), radius: 20.0);

    canvas.drawArc(rect, -pi /2, pi / 2, false, Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round);

    canvas.drawArc(rect, 0.0, pi / 2, false, Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round);

    canvas.drawArc(rect, pi /2, pi / 2, false, Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round);

    canvas.drawArc(rect, pi, pi / 2, false, Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round);


    canvas.drawCircle(Offset(radius * 1.50, radius * 1.50), radius /2.5, Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}








