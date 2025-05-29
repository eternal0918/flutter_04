import 'package:flutter/material.dart';

class EternalColors {
  // static const Color primaryColor = Color.fromRGBO(53, 55, 68, 1);
  static const Color secondaryColor = Color.fromRGBO(78, 80, 93, 1);
  static int index = 0;

  static Color getPrimaryColor() {
    List<Color> colorList = [
      Colors.orange.shade900,
      Colors.deepPurple,
    ];

    return colorList[index];
  }

  static Color getSuccessColor() {
    List<Color> colorList = [
      Color.fromRGBO(103, 194, 58, 1),
      Colors.deepPurple,
    ];

    return colorList[index];
  }

  static Color getDangerColor() {
    List<Color> colorList = [
      Color.fromRGBO(245, 108, 108, 1),
      Colors.deepPurple,
    ];

    return colorList[index];
  }

  static Color getWarningColor() {
    List<Color> colorList = [
      Color.fromRGBO(230, 162, 60, 1),
      Colors.deepPurple,
    ];

    return colorList[index];
  }

  static Color getInfoColor() {
    List<Color> colorList = [
      Color.fromRGBO(39, 43, 51, 1.0),
      Colors.deepPurple,
    ];
    return colorList[index];
  }

  ///方案1
  // static const Color defaultColor = Color.fromRGBO(53, 55, 68, 1);
  // static const Color boxDefaultColor = Color.fromRGBO(59, 61, 74, 1);
  // static const Color unSelectColor = Color.fromRGBO(78, 80, 93, 1);
  // static const Color selectColor = Color.fromRGBO(149, 151, 164, 1);

  ///方案2
  // static const Color defaultColor = Color.fromRGBO(26, 32, 44, 1);
  // static const Color boxDefaultColor = Color.fromRGBO(31, 39, 53, 1.0);
  // static const Color unSelectColor = Color.fromRGBO(48, 55, 74, 1);
  // static const Color selectColor = Color.fromRGBO(149, 151, 164, 1);

  ///方案3
  static const Color defaultColor = Color.fromRGBO(28, 31, 36, 1);

  // static const Color boxDefaultColor = Color.fromRGBO(43, 47, 56, 1.0);
  static const Color boxDefaultColor = Color.fromRGBO(39, 43, 51, 1.0);
  static const Color unSelectColor = Color.fromRGBO(73, 73, 73, 1);
  static const Color selectColor = Color.fromRGBO(135, 135, 135, 1.0);
  static const Color cancelColor = Color.fromRGBO(245, 245, 245, 1.0);

  ///方案
  // static const Color defaultColor = Color.fromRGBO(25, 27, 40, 1);
  // static const Color boxDefaultColor = Color.fromRGBO(28, 30, 42, 1.0);
  // static const Color unSelectColor = Color.fromRGBO(68, 70, 85, 1);
  // static const Color selectColor = Color.fromRGBO(149, 151, 164, 1);

  static const Color titleColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color textColor = Color.fromRGBO(171, 173, 186, 1);
  static const Color secondTextColor = Color.fromRGBO(149, 151, 164, 0.7);

// static const Color defaultColor = Color.fromRGBO(244, 245, 249, 1);
// static const Color boxDefaultColor = Color.fromRGBO(221, 223, 230, 1);
// static const Color unSelectColor = Colors.grey;
// static const Color selectColor = Color.fromRGBO(37, 44, 65, 1);
// static const Color titleColor = Color.fromRGBO(37, 44, 65, 1);
// static const Color textColor = Color.fromRGBO(37, 44, 65, 0.5);
// static const Color secondTextColor = Color.fromRGBO(37, 44, 65, 1);
}
