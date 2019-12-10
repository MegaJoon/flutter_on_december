import 'package:flutter/material.dart';
import 'package:flutter_on_december/1210/product_tabs.dart';

// https://www.instagram.com/p/B5zNoh9gtYT/?igshid=1e49fvhgqv7jp

class PlayModules2App extends StatefulWidget {
  @override
  _PlayModules2AppState createState() => _PlayModules2AppState();
}

class _PlayModules2AppState extends State<PlayModules2App> {
  // tabbarview list
  List<Widget> pages;

  // double
  double padding = 16.0;

  // color
  Color _color = Color.fromRGBO(5, 145, 166, 1);
  Color _containerColor = Color.fromRGBO(12, 32, 41, 1);

  // string
  String title = "Gaming";
  String subTitle = "Products";

  // tabbar
  int _currentIndex = 0;

  void _onPressed(int num){
    setState(() {
      _currentIndex = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      backgroundColor: Colors.white,

      // appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        // left icon
        leading: Icon(Icons.arrow_back_ios, size: 24.0, color: Colors.black),

        // right icon
        actions: <Widget>[
          Icon(Icons.sort, size: 24.0, color: Colors.black),
          SizedBox(width: padding),
        ],
      ),

      // body
      body: Padding(
        padding: EdgeInsets.only(left: padding, bottom: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // text : title
            Text(title,
              style: TextStyle(
                fontSize: 12.0, color: _color, fontWeight: FontWeight.w600,
              ),
            ),

            // subtitle
            Container(
              margin: EdgeInsets.only(right: padding),
              height: 34.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // text : subtitle
                  Text(subTitle,
                    style: TextStyle(
                      fontSize: 36.0, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                  ),

                  Spacer(),

                  // text : view more
                  Text("View More",
                    style: TextStyle(
                      fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            // textfield
            Container(
              margin: EdgeInsets.only(top: padding, right: padding),
              height: 36.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.grey[200],
              ),

              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // prefix icon
                  prefixIcon: Icon(
                      Icons.search, size: 28.0, color: Colors.grey[500],
                  ),

                  // hint text
                  hintText: "Search product...",
                  hintStyle: TextStyle(
                    fontSize: 14.0, color: Colors.grey[500], fontWeight: FontWeight.w400,
                  ),

                  contentPadding: EdgeInsets.all(2.0),
                ),
              ),
            ),

            // tabbar
            Container(
              margin: EdgeInsets.only(top: padding, bottom: padding),
              height: 40.0,
              child: ListView(
                padding: EdgeInsets.only(top: padding /2),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  ProductTabs(
                    text: "Consoles",
                    isSelected: _currentIndex == 0,
                    onPressed: (){
                        setState(() {
                          _onPressed(0);
                        });
                      },
                  ),

                  ProductTabs(
                    text: "Wireless",
                    isSelected: _currentIndex == 1,
                    onPressed: (){
                      setState(() {
                        _onPressed(1);
                      });
                    },
                  ),

                  ProductTabs(
                    text: "Headsets",
                    isSelected: _currentIndex == 2,
                    onPressed: (){
                      setState(() {
                        _onPressed(2);
                      });
                    },
                  ),

                  ProductTabs(
                    text: "Gamepads",
                    isSelected: _currentIndex == 3,
                    onPressed: (){
                      setState(() {
                        _onPressed(3);
                      });
                    },
                  ),
                ],
              ),
            ),

            // tabbarview
            Flexible(
              fit: FlexFit.tight,
              child: pages[_currentIndex],
            ),

            // add to cart | buy now btn
            Container(
              margin: EdgeInsets.only(top: padding, right: padding),
              height: 40.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // add to cart container
                  Container(
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: _containerColor,
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2.0, 2.0),
                      )],
                    ),
                    child: Center(
                        child: Text("Add to cart",
                          style: TextStyle(
                            fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w400,
                          ),
                        ),
                    ),
                  ),

                  // divider
                  Container(
                    margin: EdgeInsets.symmetric(vertical: padding / 2.5),
                    width: 1.5,
                    color: Colors.grey[300],
                  ),

                  // buy now container
                  Container(
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: _containerColor,
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2.0, 2.0),
                      )],
                    ),
                    child: Center(
                      child: Text("Buy now",
                        style: TextStyle(
                          fontSize: 14.0, color: _color, fontWeight: FontWeight.w400,
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

  _definePages(){
    pages = [
      // initial page
//      Placeholder(color: Colors.red),
      PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: null),

      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.deepPurple),
    ];
  }
}
