import 'package:flutter/material.dart';

class HomeDetailsFavorite extends StatefulWidget {
  const HomeDetailsFavorite({Key? key}) : super(key: key);

  @override
  _HomeDetailsFavoriteState createState() => _HomeDetailsFavoriteState();
}

class _HomeDetailsFavoriteState extends State<HomeDetailsFavorite> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("2"),
      ),
    );
  }
}
