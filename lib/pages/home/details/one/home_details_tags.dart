import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';

import '../../../../constants/eternal_colors.dart';
import '../../../../constants/eternal_constants.dart';

class HomeDetailsTags extends StatefulWidget {
  const HomeDetailsTags({Key? key}) : super(key: key);

  @override
  _HomeDetailsTagsState createState() => _HomeDetailsTagsState();
}

class _HomeDetailsTagsState extends State<HomeDetailsTags> {
  String currentTime = EternalConstants.getCurrentTime();

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 2,
          child: ShaderMask(
            shaderCallback: (bounds) => const RadialGradient(
              center: Alignment.topLeft,
              radius: 2,
              colors: [
                Colors.white,
                Colors.blueAccent,
                Colors.white,
              ],
              tileMode: TileMode.mirror,
            ).createShader(bounds),
            child: Wrap(
              spacing: EternalMargin.miniMargin,
              runSpacing: EternalMargin.miniMargin,
              children: List<Widget>.generate(
                7,
                (index) => Material(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(50),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      print("点击");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                      child: Text(
                        "# ${EternalConstants.getMockData.lorem.word()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: EternalFontSize.base(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Expanded(
        //   child: TextButton.icon(
        //     label: Text(currentTime, style: TextStyle(color: EternalColors.selectColor, fontSize: EternalFontSize.base())),
        //     icon: Icon(Icons.access_time, color: EternalColors.selectColor, size: EternalIconSize.smallSize),
        //     onPressed: () {},
        //   ),
        // )
      ],
    );
  }
}
