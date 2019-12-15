import 'package:flutter/material.dart';

class SecondShoesPage extends StatefulWidget {
  @override
  _SecondShoesPageState createState() => _SecondShoesPageState();
}

class _SecondShoesPageState extends State<SecondShoesPage> {
  // double
  double padding = 16.0;
  double radius = 24.0;

  // color
  Color _color = Color.fromRGBO(224, 65, 145, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background color
      backgroundColor: Colors.white,

      // body
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
                    onPressed: () {
                      // move back
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.menu, size: 24.0, color: Colors.black),
                  ),

                  Spacer(),

                  // right icon
                  IconButton(
                    onPressed: () {
//                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.shopping_basket,
                        size: 24.0, color: Colors.black),
                  ),
                ],
              ),
            ),

            // text : title
            Container(
              margin: EdgeInsets.only(top: padding, left: padding, right: padding),
              height: 64.0,
              child: Row(
                children: <Widget>[
                  // text
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "For ",
                          style: TextStyle(
                              fontSize: 32.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "treating\n",
                          style: TextStyle(
                              fontSize: 32.0,
                              color: _color,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "foot problems",
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),

                  // iconbutton in container
                  Container(
                    height: 32.0,
                    width: 32.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius /3),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1.0,
                        blurRadius: 1.0,
                      )],
                    ),
                    child: Center(
                      child: Transform.rotate(
                          angle: 1.56,
                          child: Icon(
                              Icons.tune, size: 20.0, color: Colors.black,
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
    );
  }
}
