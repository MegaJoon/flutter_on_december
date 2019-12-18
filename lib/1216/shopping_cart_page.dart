import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_on_december/1216/food_list.dart';

class ShoppingCartPage extends StatefulWidget {
  final int index;

  ShoppingCartPage(this.index);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> with SingleTickerProviderStateMixin {
  // double
  double padding = 16.0;
  double radius = 24.0;

  // isReverse
  bool isReverse = false;

  // animation
  AnimationController _animationController;
  Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(seconds: 8),
        vsync: this,
    );
    
    animation = Tween<double>(begin: 0.0, end: pi *2).animate(_animationController)
    ..addListener((){
      setState(() {
      });
    })
    ..addStatusListener((status){
      if(status == AnimationStatus.completed){
        _animationController.repeat();
      }
    });
    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top container
          Positioned.fill(
              child: Hero(
                tag: "background ${widget.index}",
                child: Container(
                  color: foodList[widget.index].color,
                  child: Placeholder(),
                ),
              ),
          ),

          // bottom container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: padding, left: padding, right: padding),
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                )],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // text: title
                  Text("Fusill Pasta Shrimp",
                    style: TextStyle(
                      fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                  ),

                  // score
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, size: 14.0, color: Colors.black),
                      Icon(Icons.star, size: 14.0, color: Colors.black),
                      Icon(Icons.star, size: 14.0, color: Colors.black),
                      Icon(Icons.star, size: 14.0, color: Colors.black),
                      Icon(Icons.star, size: 14.0, color: Colors.grey[200]),
                    ],
                  ),

                  // price
                  Container(
                    margin: EdgeInsets.only(top: padding, bottom: padding),
                    height: 40.0,
                    child: Row(
                      children: <Widget>[
                        // cnt
                        Container(
                          padding: EdgeInsets.all(padding /4),
                          height: 32.0,
                          width: 80.0,
                          decoration: ShapeDecoration(
                            shape: StadiumBorder(),
                            color: foodList[widget.index].color,
                            shadows: [BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                            )],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // arrow down icon
                              Icon(Icons.keyboard_arrow_down, size: 12.0, color: Colors.white,),

                              // text: cnt
                              Text("1",
                                style: TextStyle(
                                  fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Spacer(),

                        // text: price
                        Text(foodList[widget.index].price,
                          style: TextStyle(
                            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // text: about this food
                  Text("about this food",
                    style: TextStyle(
                      fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: padding),

                  // text: description
                  Text(foodList[widget.index].description,
                    style: TextStyle(
                      fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w300,
                      height: 1.5,
                    ),
                  ),
                  Text(foodList[widget.index].description,
                    style: TextStyle(
                      fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w300,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // bottom container in bottom container
          Positioned(
            left: 0,
            right: 0,
            bottom: 64.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding *3),
              height: 110.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.80), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: <Widget>[
                  // favorite container
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: foodList[widget.index].color.withOpacity(0.50),
                          width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                          Icons.favorite_border,
                          size: 20.0,
                          color: foodList[widget.index].color,
                      ),
                    ),
                  ),

                  Spacer(),

                  // add to cart container
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isReverse = !isReverse;
                      });
                    },
                    child: Container(
                      height: 40.0,
                      width: 150.0,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: foodList[widget.index].color,
                        shadows: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                        )],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // icon: add
                          Icon(
                            Icons.add_photo_alternate,
                            size: 20.0,
                          color: Colors.white,
                          ),

                          SizedBox(width: padding /2),

                          // text: add to cart
                          Text("Add to Cart",
                            style: TextStyle(
                              fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                alignment: Alignment.centerLeft,
                height: 40.0,
                child: IconButton(
                  onPressed: (){
                    // move back page
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 28.0, color: Colors.grey,),
                ),
              ),
            ),
          ),

          // image in top container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.60,
            child: Hero(
              tag: "image ${widget.index}",
              child: Transform.rotate(
                angle: isReverse? -animation.value + pi : animation.value,
                child: Image.asset(
                  foodList[widget.index].image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // bottom bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding * 4),
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius *1.5),
                  topRight: Radius.circular(radius *1.5),
                ),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2.0,
                  blurRadius: 4.0,
                )],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu, size: 28.0, color: Colors.black54),
                  Icon(Icons.home, size: 28.0, color: Colors.black54),
                  Icon(Icons.person_outline, size: 28.0, color: Colors.black54),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
