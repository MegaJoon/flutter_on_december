import 'package:flutter/material.dart';

// https://dribbble.com/shots/7170795-Cake-Studio-App

class CakeApp extends StatefulWidget {
  @override
  _CakeAppState createState() => _CakeAppState();
}

class _CakeAppState extends State<CakeApp> {
  // double
  double radius = 24.0;
  double padding = 16.0;
  
  // color
  Color _color = Color.fromRGBO(253, 127, 165, 1);
  
  // image
  String _backgroundImage = "assets/1224/backgroundImage.jpg";
  String _profileImage = "https://cdn.pixabay.com/photo/2019/12/15/18/24/winter-4697776__340.jpg";
  String _iconImage = "assets/1224/icon.png";
  String _iconImage1 = "assets/1224/icon1.png";
  String _iconImage2 = "assets/1224/icon2.png";

  // text
  String text = "How would you\nlike to order?";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // top continaer
          Flexible(
            child: Stack(
              children: <Widget>[
                // background image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius),
                      ),

                      image: DecorationImage(
                        image: AssetImage(_backgroundImage),
                        fit: BoxFit.fill,
                      ),

                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 2.0,
                      )],
                    ),

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(radius),
                          bottomRight: Radius.circular(radius),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.20),
                            Colors.black.withOpacity(0.50),
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ),

                // appbar
                Positioned(
                  top: 0,
                  left: padding,
                  right: padding,
                  child: SafeArea(
                    top: true,
                    left: true,
                    right: true,
                    child: Container(
                      height: 180.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // appbar
                          Row(
                            children: <Widget>[
                              // left: profile image
                              Container(
                                height: 32.0,
                                width: 32.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(_profileImage),
                                    fit: BoxFit.fill,
                                  ),
                                  boxShadow: [BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 2.0,
                                    blurRadius: 2.0,
                                  )],
                                ),
                              ),

                              Spacer(),

                              // right icon
                              Icon(
                                Icons.shopping_cart,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ],
                          ),

                          // text: How would u ----?
                          Padding(
                            padding: EdgeInsets.only(left: padding *2),
                            child: Text(text,
                              style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // bottom boxes
                Positioned(
                  left: padding *3,
                  right: padding *3,
                  bottom: 20.0,
                  child: Container(
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // customize
                        Container(
                          padding: EdgeInsets.all(padding /2),
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius /2),
                            color: _color,
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2.0,
                              blurRadius: 2.0,
                            )],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // icon
                              Container(
                                height: 28.0,
                                width: 28.0,
                                child: Image.asset(
                                  _iconImage,
                                  fit: BoxFit.fill,
                                  color: Colors.white,
                                ),
                              ),

                              // text
                              Text("Customize",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // browse
                        Container(
                          padding: EdgeInsets.all(padding /2),
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius /2),
                            color: _color,
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2.0,
                              blurRadius: 2.0,
                            )],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // icon
                              Container(
                                height: 28.0,
                                width: 28.0,
                                child: Image.asset(
                                  _iconImage1,
                                  fit: BoxFit.fill,
                                  color: Colors.white,
                                ),
                              ),

                              // text
                              Text("Browse",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // history
                        Container(
                          padding: EdgeInsets.all(padding /2),
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius /2),
                            color: _color,
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2.0,
                              blurRadius: 2.0,
                            )],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // icon
                              Container(
                                height: 28.0,
                                width: 28.0,
                                child: Image.asset(
                                  _iconImage2,
                                  fit: BoxFit.fill,
                                  color: Colors.white,
                                ),
                              ),

                              // text
                              Text("History",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
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
          ),

          // textField
          Container(
            margin: EdgeInsets.symmetric(horizontal: padding *3),
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius /2),
              color: Colors.grey[300],
            ),
            child: Stack(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.all(padding),
                  ),
                ),

                // suffix container
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 52.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius /2),
                      color: _color,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.search, size: 24.0, color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // bottom container
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: padding, bottom: padding),
              child: Column(
                children: <Widget>[
                  // text: Available Now & View All
                  Container(
                    margin: EdgeInsets.only(top: padding *2, right: padding),
                    height: 32.0,
                    child: Row(
                      children: <Widget>[
                        // text: Available Now
                        Text("Available Now",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // spacer
                        Spacer(),

                        // text: View All
                        Text("View All",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: _color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // listview
                  Flexible(
                    fit: FlexFit.tight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: padding),
                        itemCount: myCakes.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.only(right: padding),
                            width: 140.0,
                            child: Column(
                              children: <Widget>[
                                // image
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: padding),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius /2),
                                      image: DecorationImage(
                                        image: AssetImage(myCakes[index].image),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2.0,
                                        blurRadius: 2.0,
                                      )],
                                    ),
                                  ),
                                ),

                                // text
                                Text(myCakes[index].text,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                              ],
                            ),
                          );
                        }),
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

class CakeList {
  String image;
  String text;

  CakeList({this.image, this.text});
}

List<CakeList> myCakes = [
  CakeList(image: "assets/1224/image.jpg", text: "Chocolate",),
  CakeList(image: "assets/1224/image1.jpg", text: "Fruit",),
  CakeList(image: "assets/1224/image2.jpg", text: "Pie",),
];
















