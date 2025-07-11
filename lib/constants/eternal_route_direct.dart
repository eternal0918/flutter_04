import 'package:flutter/animation.dart';

class EternalRouteDirect {
  static const String bottomToTop = "bottomToTop";
  static const String topToBottom = "topToBottom";
  static const String leftToRight = "leftToRight";
  static const String rightToLeft = "rightToLeft";

  /// 底部弹出
  static Tween<Offset> btt = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);

  /// 顶部弹出
  static Tween<Offset> ttb = Tween(begin: const Offset(0.0, -1.0), end: Offset.zero);

  /// 左侧弹出
  static Tween<Offset> ltr = Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero);

  /// 右侧弹出
  static Tween<Offset> rtl = Tween(begin: const Offset(1, 0), end: Offset.zero);
}
