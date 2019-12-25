import 'package:flutter/material.dart';
import 'package:flutter_on_december/1225/second_christmas_app.dart';

// https://dribbble.com/shots/9159346-Christmas-Box-App

// image: https://dribbble.com/shots/2383575-X-Mas-Party

class ChristmasBoxApp extends StatefulWidget {
  @override
  _ChristmasBoxAppState createState() => _ChristmasBoxAppState();
}

class _ChristmasBoxAppState extends State<ChristmasBoxApp> {
  // image
  String _image = "assets/1225/image3.gif";
  
  // color
  Color _color = Color.fromRGBO(0, 34, 84, 1);

  // double
  double padding = 16.0;

  // text
  String title = "Christmas Box";
  String text = "Get ready for Christmas with our app.\nMake gift lists. Calculate the budget\ncorrectly. Send Congradulations.\nPlan your perfect holidays.";

  @override
  Widget build(BuildContext context) {
    // screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.35,
            child: Image.asset(
              _image,
              fit: BoxFit.fill,
            ),
          ),

          // bottom container
          Positioned(
            top: screenHeight * 0.60,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(padding),
              color: _color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // text: title
                  Text(title,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Luna",
                    ),
                  ),

                  // text: text
                  Text(text,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  Spacer(),

                  // container btn
                  InkWell(
                    onTap: (){
                      // todo : on Clicked: move next page;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondChristmasApp()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(padding),
                      height: 48.0,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Colors.white,
                        shadows: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5.0,
                          blurRadius: 5.0,
                          offset: Offset(5.0, 5.0),
                        )],
                      ),
                      child: Center(
                        child: Text("Let's Begin",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: _color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
