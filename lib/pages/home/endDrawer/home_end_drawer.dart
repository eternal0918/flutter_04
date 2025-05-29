import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

class HomeEndDrawer extends StatelessWidget {
  const HomeEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeEndDrawerPage();
  }
}

class HomeEndDrawerPage extends StatefulWidget {
  const HomeEndDrawerPage({super.key});

  @override
  State<HomeEndDrawerPage> createState() => _HomeEndDrawerPageState();
}

class _HomeEndDrawerPageState extends State<HomeEndDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("通知", style: TextStyle(color: Colors.white)),
        backgroundColor: EternalColors.defaultColor,
      ),
      body: Container(
        padding: EdgeInsets.all(EternalPadding.defaultPadding),
        child: Ink(
          child: InkWell(
            onTap: () {
              // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //   content: Text('Tap'),
              // ));
            },
            splashColor: Colors.red,
            child: Container(
              child: Text("111"),
            ),
          ),
        ),
      ),
    );
  }
}
