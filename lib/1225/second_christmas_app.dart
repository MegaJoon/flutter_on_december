import 'package:flutter/material.dart';

// second christmas box app;

class SecondChristmasApp extends StatefulWidget {
  @override
  _SecondChristmasAppState createState() => _SecondChristmasAppState();
}

class _SecondChristmasAppState extends State<SecondChristmasApp> {
  // color
  Color _bottomColor = Color.fromRGBO(214, 30, 42, 1);
  Color _color = Color.fromRGBO(27, 81, 133, 1);
  Color _containerColor = Color.fromRGBO(198, 210, 216, 1);

  // double
  double padding = 16.0;
  double radius = 24.0;

  // image
  String _topImage = "assets/1225/image2.gif";
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main column
          Positioned.fill(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // top image
                    Container(
                      height: 150.0,
                      width: screenWidth,
                      child: Image.asset(
                        _topImage,
                        fit: BoxFit.fill,
                      ),
                    ),

                    // text: Budget\n price
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                      children: [
                        // text: Budget
                        TextSpan(text: "Budget\n",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: _color,
                              fontWeight: FontWeight.bold,
                            ),
                        ),

                        // text: $1280
                        TextSpan(text: "\$1280",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: _color,
                              fontWeight: FontWeight.bold,
                            ),
                        ),

                        // text: / $2000
                        TextSpan(text: "/\$2000",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: _bottomColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),),

                    // text: Gift list
                    Container(
                      margin: EdgeInsets.only(top: padding, left: padding),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Gift Lists",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: _color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // continaer : Family
                    Container(
                      margin: EdgeInsets.only(top: padding, left: padding, right: padding),
                      height: 250.0,
                      child: Stack(
                        children: <Widget>[
                          // bottom container
                          Positioned.fill(
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 80.0,
                              left: padding,
                              right: padding,
                              bottom: padding,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius),
                                color: _containerColor,
                                boxShadow: [BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2.0,
                                  blurRadius: 2.0,
                                  offset: Offset(2.0, 2.0),
                                )],
                              ),
                              child: ListView.separated(

                                itemCount: 4,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index){
                                  return Container(
                                    height: 28.0,
                                    child: Row(
                                        children: <Widget>[
                                          // check icon
                                          Icon(
                                            Icons.check_circle_outline,
                                            size: 16.0,
                                            color: Colors.green,
                                          ),

                                          SizedBox(width: 8.0),

                                          // text: Mom
                                          Text("Mom",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),

                                          Spacer(),

                                          // text: $90/
                                          Text("\$90/",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),

                                          // text: $100
                                          Text("\$100",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: _bottomColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                  );
                                },

                                separatorBuilder: (context, index){
                                  return Divider();
                                },
                              ),
                            ),
                          ),

                          // top container
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: padding),
                              height: 72.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius /2),
                                color: _color,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  // text: Family
                                  Text("Family",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  // text: 4 people
                                  Text("4 people",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // topRight image
                          Positioned(
                            top: -16.0,
                            right: 0,
                            height: 120.0,
                            width: 150.0,
                            child: Image.asset(
                              "assets/1225/image.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),

          // bottom bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 64.0,
              color: _bottomColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.format_list_bulleted,
                    size: 28.0,
                    color: Colors.white,
                  ),

                  Icon(
                    Icons.card_giftcard,
                    size: 28.0,
                    color: Colors.white54,
                  ),

                  Icon(
                    Icons.calendar_today,
                    size: 28.0,
                    color: Colors.white54,
                  ),

                  Icon(
                    Icons.mail_outline,
                    size: 28.0,
                    color: Colors.white54,
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

class FamilyList {
  bool isChecked;
  String text;
  String price;
  String price2;

  FamilyList({this.isChecked, this.text, this.price, this.price2});
}

List<FamilyList> family = [
  FamilyList(isChecked: true, text: "Mom", price: "\$90/", price2: "\$100"),
  FamilyList(isChecked: true, text: "Dad", price: "\$100/", price2: "\$100"),
  FamilyList(isChecked: false, text: "Sister", price: "\$10/", price2: "\$50"),
  FamilyList(isChecked: false, text: "Grandma", price: "\$0/", price2: "\$70"),
];



















