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
  double radius = 8.0;

  // bottom tab index
  int currentIndex = 1;

  // bottom tab Function
  void _onPressed(int num){
    setState(() {
      currentIndex = num;
      print("currentIndex = $currentIndex");
    });
  }
  
  // color list
  Color _depositColor = Color.fromRGBO(87, 151, 246, 1);
  Color _withdrawColor = Color.fromRGBO(230, 94, 151, 1);
  
  Color _color00 = Color.fromRGBO(252, 136, 192, 1);
  Color _color01 = Color.fromRGBO(161, 186, 255, 1);

  Color _color10 = Color.fromRGBO(255, 147, 176, 1);
  Color _color11 = Color.fromRGBO(252, 243, 161, 1);

  Color _paymentsColor = Color.fromRGBO(255, 203, 190, 1);
  Color _paymentsColor1 = Color.fromRGBO(237, 237, 237, 1);

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
      // part 1
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
                        borderRadius: BorderRadius.circular(radius),
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
                margin: EdgeInsets.only(right: padding),
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // container: Text: deposit
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          color: _depositColor,
                        ),
                        child: Center(
                          child: Text("Deposit",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // spacer
                    SizedBox(width: padding),

                    // container: Text: withdraw
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          color: _withdrawColor,
                        ),
                        child: Center(
                          child: Text("Withdraw",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // list 1. cards
              Container(
                height: 200.0,
                child: Column(
                  children: <Widget>[
                    // text: card - view all
                    Container(
                      margin: EdgeInsets.only(top: padding, right: padding, bottom: padding),
                      height: 32.0,
                      child: Row(
                        children: <Widget>[
                          // text: Cards
                          Text("Cards",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // spacer
                          Spacer(),

                          // text: view all
                          Text("View all",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: _depositColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // listview
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(bottom: padding),
                        shrinkWrap: true,
                        children: <Widget>[
                          // master card
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              gradient: LinearGradient(
                                colors: [_color00, _color01],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                              )],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // text: bank name
                                Row(
                                  children: <Widget>[
                                    // container: master card logo
                                    Container(
                                      margin: EdgeInsets.only(right: padding),
                                      height: 16.0,
                                      width: 28.0,
                                      child: Stack(
                                        children: <Widget>[
                                          // left circle container
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            bottom: 0,
                                            child: Container(
                                              width: 16.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red.withOpacity(0.80),
                                              ),
                                            ),
                                          ),

                                          // right circle container
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              width: 16.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.orange.withOpacity(0.80),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Text: bank name
                                    Text("Bank name".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                // text: balance
                                Text("\$ 823,74.00",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                // text: account number
                                Row(
                                  children: <Widget>[
                                    // text: account number
                                    Text("**** 8293",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    // spacer
                                    Spacer(),

                                    // text: expired date
                                    Text("06/24",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // visa card
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              gradient: LinearGradient(
                                colors: [_color10, _color11],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                              )],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // text: bank name
                                Row(
                                  children: <Widget>[
                                    // text: visa card logo
                                    Text("Visa".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),

                                    // spacer
                                    SizedBox(width: padding),

                                    // Text: bank name
                                    Text("Bank name".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                // text: balance
                                Text("\$ 335,90.55",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                // text: account number
                                Row(
                                  children: <Widget>[
                                    // text: account number
                                    Text("**** 8293",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    // spacer
                                    Spacer(),

                                    // text: expired date
                                    Text("06/24",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // list 2. payments
              Container(
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    // text: payments
                    Container(
                      margin: EdgeInsets.only(top: padding, right: padding, bottom: padding),
                      height: 32.0,
                      child: Row(
                        children: <Widget>[
                          // text: Payments
                          Text("Paymnets",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // spacer
                          Spacer(),

                          // text: view all
                          Text("View all",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: _depositColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // listview
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(bottom: padding),
                        shrinkWrap: true,
                        children: <Widget>[
                          // fast food
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 250.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: _paymentsColor,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                              )],
                            ),
                            child: Row(
                              children: <Widget>[
                                // icon in container
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius /2),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.pizzaSlice,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                // column
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // text: Fast Food
                                      Text("Fast Food",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      // text: Fast Food
                                      Text("Subway",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // text: price
                                Text("-\$12.50",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // coffeteria
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 250.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: _paymentsColor1,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                              )],
                            ),
                            child: Row(
                              children: <Widget>[
                                // icon in container
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius /2),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.coffee,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                // column
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // text: Coffeteria
                                      Text("Coffeteria",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      // text: Craftwork
                                      Text("Craftwork",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // text: price
                                Text("-\$12.50",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // list 3. Transactions
              Container(
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    // text: Transactions
                    Container(
                      margin: EdgeInsets.only(top: padding, right: padding, bottom: padding),
                      height: 32.0,
                      child: Row(
                        children: <Widget>[
                          // text: Transactions
                          Text("Transactions",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // spacer
                          Spacer(),

                          // text: view all
                          Text("View all",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: _depositColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // listview
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(bottom: padding),
                        shrinkWrap: true,
                        children: <Widget>[
                          // fast food
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 250.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: _paymentsColor,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                              )],
                            ),
                            child: Row(
                              children: <Widget>[
                                // icon in container
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius /2),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.pizzaSlice,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                // column
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // text: Fast Food
                                      Text("Fast Food",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      // text: Fast Food
                                      Text("Subway",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // text: price
                                Text("-\$12.50",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // coffeteria
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 250.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: _paymentsColor1,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                              )],
                            ),
                            child: Row(
                              children: <Widget>[
                                // icon in container
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius /2),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.coffee,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                // column
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // text: Coffeteria
                                      Text("Coffeteria",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      // text: Craftwork
                                      Text("Craftwork",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // text: price
                                Text("-\$12.50",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // placeholder
              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          ),
        ),
      ),

      // part 2
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
                      // text: Cards
                      Text("Cards",
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

              // placeholder
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
      Placeholder(color: Colors.tealAccent),
      Placeholder(color: Colors.indigo),
    ];
  }
}
