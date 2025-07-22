

import '../enmus/font_size_scale_enum.dart';

class EternalFontSize {
  ///字体类型 默认
  static const String sizeType = "small";

  ///辅助文字 8.0
  static double mini({String type = sizeType, double size = 8.0}) {
    return getScaleByType(type) * size;
  }

  ///正文（小） 10.0
  static double small({String type = sizeType, double size = 10.0}) {
    return getScaleByType(type) * size;
  }

  ///正文 12.0
  static double base({String type = sizeType, double size = 12.0}) {
    return getScaleByType(type) * size;
  }

  ///迷你标题 14.0
  static double regular({String type = sizeType, double size = 14.0}) {
    return getScaleByType(type) * size;
  }

  ///小标题 16.0
  static double medium({String type = sizeType, double size = 16.0}) {
    return getScaleByType(type) * size;
  }

  ///标题 18.0
  static double large({String type = sizeType, double size = 18.0}) {
    return getScaleByType(type) * size;
  }

  ///主标题 20.0
  static double mainLarge({String type = sizeType, double size = 20.0}) {
    return getScaleByType(type) * size;
  }

  ///大号标题 25.0
  static double extraLarge({String type = sizeType, double size = 25.0}) {
    return getScaleByType(type) * size;
  }

  ///超大号标题 30.0
  static double extraLargePlus({String type = sizeType, double size = 30.0}) {
    return getScaleByType(type) * size;
  }
}
