import 'package:flutter/material.dart';
import 'package:flutter_on_december/1214/shoes_list.dart';

class SecondShoesPage extends StatefulWidget {
  @override
  _SecondShoesPageState createState() => _SecondShoesPageState();
}

class _SecondShoesPageState extends State<SecondShoesPage> with SingleTickerProviderStateMixin {
  // double
  double padding = 16.0;
  double radius = 24.0;

  // color
  Color _color = Color.fromRGBO(224, 65, 145, 1);
  Color _containerColor = Color.fromRGBO(255, 246, 239, 1);

  // animation
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.50, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut))
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

            // listview
            Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: padding),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: shoesList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    return index.isOdd?
                    // 1 : right
                    Transform(
                      transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(animation.value),
                      alignment: FractionalOffset.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(bottom: padding *2),
                        height: 160.0,
                        child: Stack(
                          children: <Widget>[
                            // background color
                            Positioned(
                              top: padding,
                              left: 100.0,
                              right: 0,
                              bottom: padding,
                              child: Container(
                                padding: EdgeInsets.only(top: padding, left: 120.0, right: padding, bottom: padding),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(radius),
                                    bottomLeft: Radius.circular(radius),
                                  ),
                                  color: _containerColor,
                                  boxShadow: [BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1.0,
                                    blurRadius: 1.0,
                                    offset: Offset(1.0, 1.0),
                                  )],
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

                                    // price & buy btn
                                    Container(
                                      margin: EdgeInsets.only(top: padding, right: 0.0),
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

                                          // text buy in container
                                          Container(
                                            height: 32.0,
                                            width: 80.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(radius /3),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text("Buy".toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w400,
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
                              child: Image.asset(shoesList[index].image, fit: BoxFit.contain, width: 200.0),
                            ),
                          ],
                        ),
                      ),
                    ) :

                    // 0, 2 : left
                    Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(-animation.value),
                      alignment: FractionalOffset.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: padding *2),
                        height: 160.0,
                        child: Stack(
                          children: <Widget>[
                            // background color
                            Positioned(
                              top: padding,
                              left: 0,
                              right: 100.0,
                              bottom: padding,
                              child: Container(
                                padding: EdgeInsets.all(padding),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(radius),
                                    bottomRight: Radius.circular(radius),
                                  ),
                                  color: _containerColor,
                                  boxShadow: [BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1.0,
                                    blurRadius: 1.0,
                                    offset: Offset(1.0, 1.0),
                                  )],
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

                                    // price & buy btn
                                    Container(
                                      margin: EdgeInsets.only(top: padding, right: 120.0),
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

                                          // text buy in container
                                          Container(
                                            height: 32.0,
                                            width: 80.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(radius /3),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text("Buy".toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w400,
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
                              child: Image.asset(shoesList[index].image, fit: BoxFit.contain, width: 200.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
