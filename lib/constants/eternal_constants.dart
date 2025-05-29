import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EternalConstants {
  static double appBarHeight = AppBar().preferredSize.height;

  ///状态栏高度
  static double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

  ///导航栏+状态栏高度
  static double appBarAndStatusBarHeight = appBarHeight + statusBarHeight;

  // ///手机宽度
  // static double equipmentWidth = window.physicalSize.width / window.devicePixelRatio;
  //
  // ///手机高度
  // static double equipmentHeight = window.physicalSize.height / window.devicePixelRatio;

  static String imageUrl =
      'https://images.pexels.com/photos/14894297/pexels-photo-14894297.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

  static String randomImageUrl = "https://picsum.photos/1920/1080";

  static String getImage() {
    return "https://picsum.photos/512/${512+Random().nextInt(512)}";
  }

  static String getCurrentTime() {
    DateTime now = DateTime.now();
    var formatterOne = DateFormat('yyyy年MM月dd日 hh:mm:ss');
    var formatterTwo = DateFormat('MM月dd日 hh:mm');
    var formatterThree = DateFormat('yyyy年MM月dd日 hh:mm');
    return formatterTwo.format(now);
  }
}
