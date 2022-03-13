
import 'package:flutter/material.dart';
const kPrimaryColor = Color.fromARGB(255, 135, 212, 184);
const kTextColor = Color.fromARGB(255, 44, 42, 42);
const kBackgroundColor = Color.fromARGB(255, 248, 224, 220);
const double kDefaultPadding = 20.0;

Color getColorFromBreed(String breed){
  switch(breed){
    case "green": return Color.fromARGB(255, 135, 212, 184);
    case "red": return Color.fromARGB(181, 214, 13, 13);
    case "yellow": return Color.fromARGB(181, 253, 207, 0);
    case "black": return Color.fromARGB(195, 0, 0, 0);
    case "brown": return Color.fromARGB(223, 121, 85, 72);
    case "purple": return Color.fromARGB(206, 139, 38, 156);
    case "pink": return Color.fromARGB(235, 206, 81, 123);
    case "gray": return Color.fromARGB(255, 158, 158, 158);
    case "blue": return Color.fromARGB(255, 119, 189, 255);
    default: return Color.fromARGB(255, 207, 193, 193);
  }
}
