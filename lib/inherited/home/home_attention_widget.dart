import 'package:flutter/material.dart';

///父传值给子组件（可跨组件传值）
class HomeAttentionWidget extends InheritedWidget {
  bool isGroupView;

  HomeAttentionWidget({Key? key, required this.isGroupView, required Widget child}) : super(key: key, child: child);

  static HomeAttentionWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeAttentionWidget>()!;
  }

  @override
  bool updateShouldNotify(HomeAttentionWidget oldWidget) {
    return isGroupView != oldWidget.isGroupView;
  }
}
