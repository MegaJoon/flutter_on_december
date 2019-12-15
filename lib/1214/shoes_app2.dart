import 'package:flutter/material.dart';

class ShoesApp2 extends StatefulWidget {
  @override
  _ShoesApp2State createState() => _ShoesApp2State();
}

class _ShoesApp2State extends State<ShoesApp2> with SingleTickerProviderStateMixin {
  // double
  double padding = 16.0;
  double radius = 24.0;

  // color
  Color _color = Color.fromRGBO(224, 65, 145, 1);
  Color _backgroundColor = Color.fromRGBO(255, 246, 239, 1);

  // animation
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation = Tween<double>(begin: 0.5, end: 0.0).animate(_controller)
      ..addListener((){
        setState(() {
        });
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
              padding: EdgeInsets.symmetric(horizontal: padding /2),
              height: 32.0,
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.menu, size: 24.0, color: Colors.black),
                  ),

                  Spacer(),

                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.shopping_basket, size: 24.0, color: Colors.black),
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
                  // title
                  RichText(text: TextSpan(children: [
                    TextSpan(text: "For ", style: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold,),),
                    TextSpan(text: "treating\n", style: TextStyle(fontSize: 32.0, color: _color, fontWeight: FontWeight.bold,),),
                    TextSpan(text: "foot problems", style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w400,),),
                  ]),),

                  Spacer(),

                  // icon
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
                      child: Icon(Icons.tune, size: 16.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            // listview
            Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: shoesList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return index.isOdd?
                  Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // perspective
                      ..rotateY(animation.value),
                    alignment: FractionalOffset.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(top: padding *2),
                      height: 190.0,
                      child: Stack(
                        children: <Widget>[
                          // background container
                          Positioned(
                            top: padding,
                            left: padding *5,
                            right: 0,
                            bottom: padding,
                            child: Container(
                              padding: EdgeInsets.only(top: padding, left: 100.0, right: padding, bottom: padding),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(radius),
                                  bottomRight: Radius.circular(radius),
                                ),
                                color: _backgroundColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // text : title
                                  Text(shoesList[index].title,
                                    style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // text : subtitle
                                  Text(shoesList[index].subTitle,
                                    style: TextStyle(
                                      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: padding /2),

                                  // text : price
                                  Container(
                                    height: 32.0,
                                    child: Row(
                                      children: <Widget>[
                                        // text : price
                                        Text(shoesList[index].price,
                                          style: TextStyle(
                                            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Spacer(),

                                        Container(
                                          width: 64.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(radius /3),
                                            color: Colors.black,
                                          ),
                                          child: Center(
                                            child: Text("BUY".toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w400,
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

                          // image
                          Positioned(
                            top: 0,
                            left: 0,
                            bottom: 0,
                            child: Image.asset(shoesList[index].image, fit: BoxFit.fill, width: 200.0),
                          ),
                        ],
                      ),
                    ),
                  ) :
                  Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // perspective
                      ..rotateY(-animation.value),
                    alignment: FractionalOffset.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: padding *2),
                      height: 190.0,
                      child: Stack(
                        children: <Widget>[
                          // background container
                          Positioned(
                            top: padding,
                            left: 0,
                            right: padding *5,
                            bottom: padding,
                            child: Container(
                              padding: EdgeInsets.only(top: padding, left: padding, right: 150.0, bottom: padding),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(radius),
                                  bottomRight: Radius.circular(radius),
                                ),
                                color: _backgroundColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // text : title
                                  Text(shoesList[index].title,
                                    style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // text : subtitle
                                  Text(shoesList[index].subTitle,
                                    style: TextStyle(
                                      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: padding /2),

                                  // text : price
                                  Container(
                                    height: 32.0,
                                    child: Row(
                                      children: <Widget>[
                                        // text : price
                                        Text(shoesList[index].price,
                                          style: TextStyle(
                                            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Spacer(),

                                        Container(
                                          width: 64.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(radius /3),
                                            color: Colors.black,
                                          ),
                                          child: Center(
                                            child: Text("BUY".toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w400,
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

                          // image
                          Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Image.asset(shoesList[index].image, fit: BoxFit.fill, width: 200.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoesList {
  String image;
  String title;
  String subTitle;
  String price;

  ShoesList({this.image, this.title, this.subTitle, this.price});
}

List<ShoesList> shoesList = [
  ShoesList(image: "assets/1214/image10.png", title: "NAVRRCOWER SHOES", subTitle: "Allround Light C+", price: "\$45.9"),
  ShoesList(image: "assets/1214/image11.png", title: "NAVRRCOWER SHOES", subTitle: "Allround Light C+", price: "\$45.9"),
  ShoesList(image: "assets/1214/image12.png", title: "NAVRRCOWER SHOES", subTitle: "Allround Light C+", price: "\$45.9"),
];
