enum FontSizeScale {
  // 定义不同的字体比例
  mini(type: 'mini', scale: 0.8), // 迷你字体比例
  small(type: 'small', scale: 0.85), // 小号字体比例
  normal(type: 'normal', scale: 1.0), // 正常字体比例
  medium(type: 'medium', scale: 1.2), // 中等字体比例
  large(type: 'large', scale: 1.5); // 超大号字体比例

  // 构造函数
  const FontSizeScale({
    this.type = "normal",
    this.scale = 1.0,
  });

  // 字段：存储比例值
  final String type;
  final double scale;
}

// 获取字体比例
double getScaleByType(String type) {
  for (var item in FontSizeScale.values) {
    if (item.type == type) {
      return item.scale;
    }
  }
  return 1;
}
