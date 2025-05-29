import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';

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
          child: Wrap(
              children: List<Widget>.generate(
            10,
            (index) => const InkWell(child: Text("#梦幻", style: TextStyle(color: Colors.blueAccent, letterSpacing: 1))),
          )),
        ),
        Expanded(
          child: TextButton.icon(
            label: Text(
              "$currentTime",
              style: TextStyle(
                color: EternalColors.selectColor,
                fontSize: 12,
              ),
            ),
            icon: Icon(
              Icons.access_time,
              color: EternalColors.selectColor,
              size: EternalIconSize.smallSize,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
