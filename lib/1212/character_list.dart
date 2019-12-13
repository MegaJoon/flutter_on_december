import 'package:flutter/material.dart';

class CharacterList {
  Color color;
  String image;
  String title;
  String description;

  CharacterList({this.color, this.image, this.title, this.description});
}

List<CharacterList> characterList = [
  CharacterList(color : Color.fromRGBO(255, 128, 63, 1), image: "assets/1212/image.png", title: "Kavin", description: "Kavin is the eldest brother of the three little yellow people. He has a special sense of responsibility"),
  CharacterList(color : Color.fromRGBO(255, 52, 69, 1), image: "assets/1212/image1.png", title: "Agnes", description: "Agnes Agnes Agnes Agnes Agnes Agnes Agnes Agnes Agnes Agnes Agnes Agnes Agnes Agnes Agnes"),
];