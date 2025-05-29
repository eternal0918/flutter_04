import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

//列表 图片主体
class HomeFireBodyImage extends StatefulWidget {
  const HomeFireBodyImage({super.key});

  @override
  State<HomeFireBodyImage> createState() => _HomeFireBodyImageState();
}

class _HomeFireBodyImageState extends State<HomeFireBodyImage> {
  @override
  Widget build(BuildContext context) {
    return

        ///图片主体
        LayoutBuilder(builder: (context, constrains) {
      return Container(
        width: constrains.maxWidth,
        height: (constrains.maxWidth / 3) * 4,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(image: NetworkImage(EternalConstants.getImage()), fit: BoxFit.cover)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  margin: EdgeInsets.all(EternalMargin.miniMargin),
                  padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding, vertical: EternalPadding.miniPadding),
                  decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(20)),
                  child: Wrap(
                    spacing: EternalMargin.miniMargin,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.play_arrow_rounded, size: EternalIconSize.smallSize),
                      Text("${Random().nextInt(9999)}", style: TextStyle(fontSize: EternalFontSize.base()))
                    ],
                  ),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                  width: constrains.maxWidth,
                  padding: EdgeInsets.all(EternalPadding.smallPadding),
                  decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "治愈系画风丨原始探险荒野森林场景插画丨画风增强",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular()),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ))
          ],
        ),
      );
    });
  }
}
