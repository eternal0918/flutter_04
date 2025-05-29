import 'dart:math';
import 'dart:ui';

class EternalTabItem {
  late int value;
  late String name;

  EternalTabItem(this.value, this.name);
}

class EternalThemeItem {
  int id;
  double weight;
  String name;
  String imageUrl = "";
  Color bgColor = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);

  EternalThemeItem({
    required this.id,
    required this.name,
    required this.weight,
    required this.imageUrl,
  });
}

class EternalModelItem {
  int id;
  String name;
  String imageUrl = "";
  Color bgColor = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);

  EternalModelItem({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
