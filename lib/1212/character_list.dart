import 'package:flutter/material.dart';

class CharacterList {
  Color color;
  String image;
  String title;

  CharacterList({this.color, this.image, this.title});
}

List<CharacterList> characterList = [
  CharacterList(color : Color.fromRGBO(255, 128, 63, 1), image: "assets/1212/image.png", title: "Kavin"),
  CharacterList(color : Color.fromRGBO(255, 52, 69, 1), image: "assets/1212/image1.png", title: "Agnes"),
];