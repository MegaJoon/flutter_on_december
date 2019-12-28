import 'package:flutter/material.dart';

// bottom item list
class ItemList {
  Color color;
  IconData icon;
  String text;

  ItemList({this.color, this.icon, this.text});
}

List<ItemList> items = [
  ItemList(
    color: Color.fromRGBO(128, 196, 246, 1),
    icon: Icons.home,
    text: "Home",
  ),

  ItemList(
    color: Color.fromRGBO(247, 210, 129, 1),
    icon: Icons.search,
    text: "Search",
  ),

  ItemList(
    color: Color.fromRGBO(247, 159, 129, 1),
    icon: Icons.layers,
    text: "Reports",
  ),

  ItemList(
    color: Color.fromRGBO(88, 204, 221, 1),
    icon: Icons.notifications,
    text: "Notification",
  ),
];