//列表 内容主体
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/pages/home/details/home_details.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeFireBodyContent extends StatefulWidget {
  const HomeFireBodyContent({super.key});

  @override
  State<HomeFireBodyContent> createState() => _HomeFireBodyContentState();
}

class _HomeFireBodyContentState extends State<HomeFireBodyContent> {
  Color _favoriteColor = Colors.white;
  Color _startColor = Colors.white;
  final List<Positioned> _userAvatarList = [];

  @override
  void initState() {
    _userAvatarList.add(const Positioned(child: Text("")));
    for (int i = 0; i < 3; i++) {
      _userAvatarList.add(Positioned(
        left: (15 * i).toDouble(),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipOval(child: Image.network(EternalConstants.getImage(), fit: BoxFit.cover)),
        ),
      ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(height: 30, width: 65, child: Stack(children: _userAvatarList)),
            SizedBox(width: EternalMargin.miniMargin),
            Text("${Random().nextInt(9999)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular())),
            Text(" 关注", style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.base())),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: EternalMargin.miniMargin,
          children: [
            ///收藏
            AnimatedSwitcher(
              switchInCurve: Curves.easeInOutBack,
              transitionBuilder: (child, anim) {
                return ScaleTransition(scale: anim, child: child);
              },
              duration: Duration(milliseconds: 200),
              child: TextButton.icon(
                key: ValueKey(_startColor),
                onPressed: () {
                  setState(() {
                    _startColor == Colors.white ? _startColor = Colors.yellow.shade900 : _startColor = Colors.white;
                  });
                },
                icon: Icon(Icons.star_rounded, size: EternalIconSize.defaultSize, color: _startColor),
                label: Text("${Random().nextInt(999)}", style: TextStyle(fontSize: EternalFontSize.regular())),
              ),
            ),

            ///喜欢
            AnimatedSwitcher(
              switchInCurve: Curves.easeInOutBack,
              transitionBuilder: (child, anim) {
                return ScaleTransition(scale: anim, child: child);
              },
              duration: const Duration(milliseconds: 200),
              child: TextButton.icon(
                key: ValueKey(_favoriteColor),
                onPressed: () {
                  setState(() {
                    _favoriteColor == Colors.white ? _favoriteColor = Colors.red : _favoriteColor = Colors.white;
                  });
                },
                icon: Icon(Icons.favorite_rounded, size: EternalIconSize.smallSize, color: _favoriteColor),
                label: Text("${Random().nextInt(999)}", style: TextStyle(fontSize: EternalFontSize.regular())),
              ),
            ),

            ///评论数
            TextButton.icon(
              key: ValueKey(_favoriteColor),
              onPressed: () {},
              icon: Icon(Icons.message, size: EternalIconSize.smallSize),
              label: Text("${Random().nextInt(999)}", style: TextStyle(fontSize: EternalFontSize.regular())),
            )
          ],
        )
      ],
    );
  }
}
