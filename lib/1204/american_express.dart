import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_on_december/1204/success_page.dart';

// https://www.instagram.com/p/B5XF7B9h0UG/?igshid=zoxc2kkk4p09

class AmericanExpress extends StatefulWidget {
  @override
  _AmericanExpressState createState() => _AmericanExpressState();
}

class _AmericanExpressState extends State<AmericanExpress> with SingleTickerProviderStateMixin {
  // american express card image
  String _frontCardImage = "assets/1204/american_express.jfif";
  String _backCardImage = "assets/1204/american_express_back_side.jpg";

  Animation<double> animation;
  AnimationController _controller;

  double padding = 16.0;

  double offSetX = 0.0;

  // text
  String accountNumber = "";
  String expiredDate = "";
  String cvv = "";

  // finish sig
  bool isFront = false;
  bool isAccountNumber = false;
  bool isExpiredDate = false;
  bool isCvv = false;

  // change page function
  void _changePage() {
    _controller.forward();
    setState(() {});
  }

  // insert num
  void _insertNum(String num) {
    setState(() {
      // account number
      if (isAccountNumber == false) {
        accountNumber += num;
        switch (accountNumber.length) {
          case 4:
            accountNumber += " ";
            break;
          case 9:
            accountNumber += " ";
            break;
          case 14:
            accountNumber += " ";
            break;
          case 19:
            isAccountNumber = true;
            offSetX = 50.0;
            _scrollListener();
            break;
        }
      } else if (isExpiredDate == false) {
        expiredDate += num;
        switch (expiredDate.length) {
          case 2:
            expiredDate += "/";
            break;

          case 5:
            isExpiredDate = true;
            offSetX = 80.0;
            _scrollListener();
            _changePage();
            break;
        }
      } else if (isCvv == false) {
        if (cvv.length >= 3) {
        } else if (cvv.length == 2) {
          isCvv = true;
          cvv += num;
        } else
          cvv += num;
      }
    });
  }

  // scroll
  ScrollController _scrollController;

  // move scroll
  _scrollListener() {
    setState(() {
      _scrollController.animateTo(offSetX, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    });
  }

  @override
  void initState() {
    // scrollcontroller
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    // animation
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: pi).animate(_controller)
      ..addListener(() {})
      ..addStatusListener((status) {
        setState(() {
          if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) isFront = !isFront;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // card box
            Container(
              margin: EdgeInsets.all(padding),
              height: 200.0,
              child: Stack(
                children: <Widget>[
                  // build animated builder;
                  Positioned.fill(
                    child: AnimatedBuilder(
                      animation: animation,
                      builder: (BuildContext context, Widget child) {
                        var transform = Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(animation.value);
                        return Transform(
                          transform: transform,
                          alignment: Alignment.center,
                          child: child,
                        );
                      },
                      child: isFront ? backContainer() : frontContainer(),
                    ),
                  ),

                  // accountNumber text
                  Positioned(
                    top: 100.0,
                    left: padding * 3,
                    right: padding * 2,
                    child: isExpiredDate
                        ? Container()
                        : Container(
                            height: 32.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                accountNumber,
                                style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "San Marino Beach"),
                              ),
                            ),
                          ),
                  ),

                  // expired date text
                  Positioned(
                    bottom: padding,
                    right: padding * 2,
                    child: isExpiredDate
                        ? Container()
                        : Container(
                            height: 32.0,
                            width: 100.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                expiredDate,
                                style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "San Marino Beach"),
                              ),
                            ),
                          ),
                  ),

                  // cvv text
                  Positioned(
                    top: padding * 1.5,
                    left: padding * 2,
                    right: padding * 2,
                    child: Container(
                      height: 32.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cvv,
                          style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // text
            Container(
              height: 64.0,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2)]),
              child: ListView(
                padding: EdgeInsets.zero,
                controller: _scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // account number
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                    width: 150.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            "CARD NUMBER".toUpperCase(),
                            style: TextStyle(fontSize: 12.0, color: isAccountNumber ? Colors.grey : Colors.black, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            accountNumber,
                            style: TextStyle(fontSize: 14.0, color: isAccountNumber ? Colors.grey : Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // expired date
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                    width: 100.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            "EXPIRED DATE".toUpperCase(),
                            style: TextStyle(
                                fontSize: 12.0, color: (isAccountNumber && !isExpiredDate) ? Colors.black : Colors.grey, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            expiredDate,
                            style: TextStyle(
                                fontSize: 14.0, color: (isAccountNumber && !isExpiredDate) ? Colors.black : Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // cvv
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                    width: 150.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            "CVV/CVC".toUpperCase(),
                            style: TextStyle(fontSize: 12.0, color: isExpiredDate ? Colors.black : Colors.grey, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            cvv,
                            style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // next - done
            Container(
              height: 64.0,
              color: Colors.black,
              child: Center(
                child: isCvv
                    ? InkWell(
                        onTap: () {
                          print("on clicked : DONE!");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage()));
                        },
                        child: Text(
                          "DONE".toUpperCase(),
                          style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: isAccountNumber ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                        children: <Widget>[
                          isAccountNumber
                              ? Text(
                                  "BACK".toUpperCase(),
                                  style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
                                )
                              : Container(),
                          Text(
                            "NEXT".toUpperCase(),
                            style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
              ),
            ),

            // keypad
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.all(padding),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("1");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: padding / 2),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("2");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "ABC",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: padding / 2),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("3");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "DEF",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: padding / 2),
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("4");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "4",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "GHI",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: padding / 2),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("5");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "5",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "JKL",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: padding / 2),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("6");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "6",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "MNO",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: padding / 2),
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("7");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "7",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "PQRS",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: padding / 2),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("8");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "8",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "TUV",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: padding / 2),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("9");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "9",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "WXYZ",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: padding / 2),
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(),
                          ),
                          SizedBox(width: padding / 2),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                _insertNum("0");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // num
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // alphabet
                                      Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: padding / 2),
                          Flexible(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: padding),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // front container
  Widget frontContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: AssetImage(_frontCardImage),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
        ),
      ),
    );
  }

  // back container
  Widget backContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: AssetImage(_backCardImage),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
        ),
      ),
    );
  }
}
