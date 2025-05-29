import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';

class PersonSideVip extends StatefulWidget {
  const PersonSideVip({super.key});

  @override
  State<PersonSideVip> createState() => _PersonSideVipState();
}

class _PersonSideVipState extends State<PersonSideVip> {
  final Color _color = const Color.fromRGBO(250, 222, 185, 1);
  final TextStyle _textStyle = const TextStyle(
    color: Color.fromRGBO(250, 222, 185, 1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      appBar: AppBar(
        backgroundColor: EternalColors.defaultColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: _color,
          splashRadius: 20,
        ),
        title: Text("会员中心", style: _textStyle),
        actions: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                TextButton(onPressed: () {}, child: Text("转换", style: _textStyle)),
                TextButton(onPressed: () {}, child: Text("记录", style: _textStyle)),
              ],
            ),
          )
        ],
        centerTitle: true,
      ),
    );
  }
}
