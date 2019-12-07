import 'package:flutter/material.dart';
import 'package:flutter_on_december/1202/blackberry_app.dart';
import 'package:flutter_on_december/1203/food_delivery_app.dart';
import 'package:flutter_on_december/1204/american_express.dart';
import 'package:flutter_on_december/1205/airbnb_app.dart';
import 'package:flutter_on_december/1205/airbnb_concept.dart';
import 'package:flutter_on_december/1206/galactic_bnb.dart';
import 'package:flutter_on_december/1207/clone_galactic_bnb.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: BlackberryApp(),  // 12-02
//      home: FoodDeliveryApp(),  // 12-03
//      home: AmericanExpress(),  // 12-04
//      home: AirbnbConcept(),  // 12-05
//      home: AirbnbApp(),  // 12-05
//      home: GalacticBnb(),  // 12-06
      home: CloneGalacticBnb(),  // 12-07
    );
  }
}