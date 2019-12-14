import 'package:flutter/material.dart';
import 'package:flutter_on_december/1202/blackberry_app.dart';
import 'package:flutter_on_december/1203/food_delivery_app.dart';
import 'package:flutter_on_december/1204/american_express.dart';
import 'package:flutter_on_december/1205/airbnb_app.dart';
import 'package:flutter_on_december/1205/airbnb_concept.dart';
import 'package:flutter_on_december/1206/galactic_bnb.dart';
import 'package:flutter_on_december/1207/banking/banking_app.dart';
import 'package:flutter_on_december/1207/clone_galactic_bnb.dart';
import 'package:flutter_on_december/1207/courses_ui.dart';
import 'package:flutter_on_december/1208/todo_app.dart';
import 'package:flutter_on_december/1209/movie_app.dart';
import 'package:flutter_on_december/1210/play_module2_app.dart';
import 'package:flutter_on_december/1210/play_modules_app.dart';
import 'package:flutter_on_december/1211/work_life_balance.dart';
import 'package:flutter_on_december/1212/movie_character_ui.dart';
import 'package:flutter_on_december/1214/shoes_app.dart';

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
//      home: CloneGalacticBnb(),  // 12-07
//      home: CoursesUI(),  // 12-07
//      home: BankingApp(),  // 12-07
//      home: TodoApp(),  // 12-08
//      home: MovieApp(),  // 12-09
//      home: PlayModulesApp(),  // 12-10
//      home: PlayModules2App(),  // 12-10
//      home: WorkLifeBalance(),  // 12-11
//      home: MovieCharachterUI(),  // 12-12
      home: ShoesApp(),  // 12-14
    );
  }
}