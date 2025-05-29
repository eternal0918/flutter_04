import 'package:flutter/material.dart';
import 'package:flutter_04/entity/eternal_entity.dart';

class HomeFireFilterThemeNotification extends Notification {
  late String type;
  late EternalThemeItem selectedThemeItem;
  late EternalModelItem selectedModelItem;

  HomeFireFilterThemeNotification(type, selectedThemeItem, selectedModelItem) {
    type ??= "";
    selectedThemeItem ??= EternalThemeItem(id: 0, name: "", weight: 0.0, imageUrl: "");
    selectedModelItem ??= EternalModelItem(id: 0, name: "", imageUrl: "");
    this.type = type;
    this.selectedThemeItem = selectedThemeItem;
    this.selectedModelItem = selectedModelItem;
  }
}
