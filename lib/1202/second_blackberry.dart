import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_on_december/1202/blackberry_list.dart';

class SecondBlackberry extends StatefulWidget {
  int index;

  SecondBlackberry(this.index);

  @override
  _SecondBlackberryState createState() => _SecondBlackberryState();
}

class _SecondBlackberryState extends State<SecondBlackberry> {
  double padding = 24.0;

  // color list
  Color _backgroundColor = Color.fromRGBO(32, 31, 45, 1);
  Color _bottomBarColor = Color.fromRGBO(14, 13, 19, 1);
  Color _bottomTabColor = Color.fromRGBO(68, 65, 78, 1);

  @override
  Widget build(BuildContext context) {
    // screen height in device
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.45,
            child: Image.asset(blackberryList[widget.index].image, fit: BoxFit.fill),
          ),

          // back button
          Positioned(
            top: padding,
            left: padding,
            child: SafeArea(
              top: true,
              child: Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(padding / 3),
                  color: _backgroundColor,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // bottom sheet
          Positioned(
            top: screenHeight * 0.50,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(padding * 2),
                  topRight: Radius.circular(padding * 2),
                ),
                color: _bottomBarColor,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.50,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.all(padding * 1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(padding * 2),
                    topRight: Radius.circular(padding * 2),
                  ),
                  color: _backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // title
                    Text(
                      blackberryList[widget.index].title,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // subtitle
                    Text(
                      blackberryList[widget.index].subTitle,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 16.0),

                    // setting
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: padding * 0.50),
                          height: 40.0,
                          width: 64.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "15%",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Alcohol",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: padding * 0.50),
                          height: 40.0,
                          width: 64.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "25%",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Fresh",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: padding * 0.50),
                          height: 40.0,
                          width: 64.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "60%",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Wines",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.0),

                    // price
                    Container(
                      height: 52.0,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: _bottomBarColor,
                              ),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "\$8",
                                      style: TextStyle(fontSize: 24.0, color: Colors.grey, fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: " Price * Drink",
                                      style: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: padding * 0.50),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: _bottomBarColor,
                              ),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "\$16",
                                      style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: " Total Price",
                                      style: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold),
                                    ),
                                  ]),
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
          ),

          // bottom text
          Positioned(
            left: padding * 1.5,
            right: padding * 1.5,
            bottom: padding * 1.5,
            child: Container(
              height: 150.0,
              child: Row(
                children: <Widget>[
                  //
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // total order text
                        Text(
                          "Total Order",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8.0),

                        // Row
                        Row(
                          children: <Widget>[
                            // item count
                            Container(
                              margin: EdgeInsets.only(right: padding * 2),
                              height: 64.0,
                              width: 80.0,
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Icon(Icons.person_outline, size: 36.0, color: Colors.grey),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            height: 24.0,
                                            width: 24.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _backgroundColor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "3",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Item Count",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // price
                            Container(
                              margin: EdgeInsets.only(right: padding * 2),
                              height: 64.0,
                              width: 80.0,
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Center(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text("\$",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),

                                                Text("32",
                                                  style: TextStyle(
                                                    fontSize: 24.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Total Price",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // container
                  Container(
                    padding: EdgeInsets.symmetric(vertical: padding),
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(padding),
                      color: _bottomTabColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 20.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.black,
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 4.0,
                                left: 10.0,
                                bottom: 4.0,
                                child: Container(
                                  width: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 4.0,
                                right: 10.0,
                                bottom: 4.0,
                                child: Container(
                                  width: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text("MasterCard",
                        style: TextStyle(
                          fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w600,
                        ),
                        ),

                        Text("Pay",
                          style: TextStyle(
                            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600,
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, size.height * 0.65 - 20.0)
      ..quadraticBezierTo(5.0, size.height * 0.65 - 5.0, 20.0, size.height * 0.65)
      ..lineTo(size.width - 20.0, size.height * 0.85)
      ..quadraticBezierTo(size.width - 5.0, size.height * 0.85 - 5.0, size.width, size.height * 0.85 - 25.0)
      ..lineTo(size.width, 0.0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
