import 'package:flutter/material.dart';

class EternalShadow {
  ///  卡片阴影
  static List<BoxShadow> cardShadow = [
    const BoxShadow(
        color: Colors.black26,
        offset: Offset(0.0, 4.0), //阴影xy轴偏移量
        blurRadius: 5.0, //阴影模糊程度
        spreadRadius: -4.0 //阴影扩散程度
        )
  ];
}
