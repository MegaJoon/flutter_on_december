import 'package:flutter/material.dart';
import 'package:flutter_on_december/1223/my_bottom_tabs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/9144357-Financing-App/attachments/1195108?mode=media

class FinancingApp extends StatefulWidget {
  @override
  _FinancingAppState createState() => _FinancingAppState();
}

class _FinancingAppState extends State<FinancingApp> {
  // list widget
  List<Widget> pages;

  // double
  double padding = 16.0;

  // bottom tab index
  int currentIndex = 0;

  // bottom tab Function
  void _onPressed(int num){
    setState(() {
      currentIndex = num;
      print("currentIndex = $currentIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main: column
          Positioned.fill(
              child: pages[currentIndex],
          ),

          // bottom bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 64.0,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //
                  MyBottomTabs(
                    icon: FontAwesomeIcons.home,
                    text: "Home",
                    isSelected: currentIndex == 0,
                    onPressed: (){
                      _onPressed(0);
                    },
                  ),

                  MyBottomTabs(
                    icon: FontAwesomeIcons.creditCard,
                    text: "Card",
                    isSelected: currentIndex == 1,
                    onPressed: (){
                      _onPressed(1);
                    },
                  ),

                  MyBottomTabs(
                    icon: FontAwesomeIcons.signal,
                    text: "Statistic",
                    isSelected: currentIndex == 2,
                    onPressed: (){
                      _onPressed(2);
                    },
                  ),

                  MyBottomTabs(
                    icon: FontAwesomeIcons.thLarge,
                    text: "Menu",
                    isSelected: currentIndex == 3,
                    onPressed: (){
                      _onPressed(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _definePages(){
    pages = [
      // I use this page
//      Placeholder(color: Colors.red),
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // appbar
              SafeArea(
                top: true,
                left: true,
                right: true,
                child: Container(
                  height: 64.0,
                  child: Row(
                    children: <Widget>[
                      // text: Wallet
                      Text("Wallet",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // spacer
                      Spacer(),

                      // right icon
                      Transform.rotate(
                        angle: 1.56,
                        child: IconButton(
                          onPressed: (){
                            print("on clicked : right icon in appbar");
                          },
                          icon: Icon(
                            Icons.tune,
                            size: 28.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // text: total price
              Container(
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // left text: total text
                    Text("\$16,180.34",
                      style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // spacer
                    Spacer(),

                    // container box: Text: USD
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      height: 32.0,
                      width: 64.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black,
                      ),
                      child: Center(
                          child: Text("USD",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              ),

              // containers: deposit; withdraw
              Container(
                height: 64.0,
                child: Placeholder(),
              ),

              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          ),
        ),
      ),

      ////////////////////////////////////////////////
      ////////////////////////////////////////////////
      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.tealAccent),
      Placeholder(color: Colors.indigo),
    ];
  }
}
