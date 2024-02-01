import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultAvaterCtr extends GetxController {
  var colorsList = {
    Colors.purpleAccent: [],
    Colors.orange: [
      'A',
      'B',
      'C',
      'D',
      'E',
    ],
    Colors.blue: [
      'F',
      'G',
      'H',
      'I',
      'J',
    ],
    Colors.green: [
      'L',
      'M',
      'N',
      'O',
      'T',
      'Q',
    ],
    Colors.teal: [
      'R',
      'S',
      'p',
      'U',
      'V',
    ],
    Colors.yellow: [
      'K',
      'W',
      'X',
      'Y',
      'Z',
    ],
  };

  Color getColor(String element) {
    Color color = Colors.indigo;
    colorsList.forEach((key, value) {
      if (value.contains(element)) {
        color = key;
      }
    });
    return color;
  }
}
