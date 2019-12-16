import 'package:flutter/material.dart';

class FoodList {
  Color color;
  String image;
  String title;
  String description;
  String price;
  
  FoodList({this.color, this.image, this.title, this.description, this.price});
}

List<FoodList> foodList = [
  FoodList(
    color: Color.fromRGBO(84, 138, 138, 1),
    image: "assets/1216/image.png",
    title: "Puran Dhaka's\nTahere",
    description: "Pasta is a type of Italian food typically made from an unleavened dough of durum wheat flour.",
    price: "\$13.00",
  ),

  FoodList(
    color: Color.fromRGBO(255, 141, 34, 1),
    image: "assets/1216/image1.png",
    title: "Puran Dhaka's\nTahere1",
    description: "Pasta is a type of Italian food typically made from an unleavened dough of durum wheat flour.",
    price: "\$12.00",
  ),

  FoodList(
    color: Color.fromRGBO(253, 106, 63, 1),
    image: "assets/1216/image2.png",
    title: "Puran Dhaka's\nTahere2",
    description: "Pasta is a type of Italian food typically made from an unleavened dough of durum wheat flour.",
    price: "\$12.00",
  ),
];