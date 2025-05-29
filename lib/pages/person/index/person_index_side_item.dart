import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/person/index/side/person_side_attention.dart';
import 'package:flutter_04/pages/person/index/side/person_side_fans.dart';
import 'package:flutter_04/pages/person/index/side/person_side_score.dart';
import 'package:flutter_04/pages/person/index/side/person_side_vip.dart';
import 'package:shimmer/shimmer.dart';

class PersonIndexSideItem extends StatefulWidget {
  const PersonIndexSideItem({super.key});

  @override
  State<PersonIndexSideItem> createState() => _PersonIndexSideItemState();
}

class _PersonIndexSideItemState extends State<PersonIndexSideItem> {
  final TextStyle _titleStyle = const TextStyle(fontSize: 28, fontFamily: "IMPACT");
  final TextStyle _secondTextStyle = const TextStyle(fontSize: 15, color: Colors.white70);

  Widget divider = SizedBox(
    width: 30,
    height: EternalMargin.largeMargin,
    child: const Divider(color: Colors.white24, thickness: 1),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: EdgeInsets.symmetric(vertical: EternalPadding.smallPadding),
      decoration: BoxDecoration(
          color: EternalColors.boxDefaultColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: EternalColors.unSelectColor, width: 0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: 60,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      ///跳转vip界面
                      EternalNavigatorRoute.push(context, const PersonSideVip());
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(0)),
                    child: const Text(
                      "VIP",
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: "videopac",
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1,
                          color: Color.fromRGBO(250, 222, 185, 1)),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: Colors.white,
                  child: SizedBox(
                    width: 60,
                    height: 40,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          ///跳转vip界面
                          EternalNavigatorRoute.push(context, const PersonSideVip());
                        },
                        child: const Text(
                          "VIP",
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: "videopac",
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          divider,
          InkWell(
            onTap: () => EternalNavigatorRoute.push(context, const PersonSideScore()),
            child: Column(children: [
              AnimatedFlipCounter(
                duration: const Duration(milliseconds: 1500),
                value: Random().nextInt(9999),
                textStyle: _titleStyle,
                curve: Curves.easeOutCirc,
              ),
              SizedBox(height: EternalMargin.smallMargin),
              Wrap(
                spacing: EternalMargin.miniMargin,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.toll, color: Colors.orange.shade900, size: EternalIconSize.smallSize),
                  Text("积分", style: _secondTextStyle)
                ],
              ),
            ]),
          ),
          divider,
          Column(children: [
            AnimatedFlipCounter(
              duration: const Duration(milliseconds: 1500),
              value: Random().nextInt(5),
              textStyle: _titleStyle,
              curve: Curves.easeOutCirc,
            ),
            SizedBox(height: EternalMargin.smallMargin),
            Wrap(
              spacing: EternalMargin.miniMargin,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.timeline, color: Colors.greenAccent, size: EternalIconSize.smallSize),
                Text("等级", style: _secondTextStyle)
              ],
            ),
          ]),
          divider,
          Column(children: [
            AnimatedFlipCounter(
              duration: const Duration(milliseconds: 1500),
              value: Random().nextInt(9999),
              textStyle: _titleStyle,
              curve: Curves.easeOutCirc,
            ),
            SizedBox(height: EternalMargin.smallMargin),
            Wrap(
              spacing: EternalMargin.miniMargin,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.favorite, color: EternalColors.getDangerColor(), size: EternalIconSize.smallSize),
                Text("获赞", style: _secondTextStyle)
              ],
            ),
          ]),
          divider,
          InkWell(
            onTap: () => EternalNavigatorRoute.push(context, const PersonSideFans()),
            child: Column(children: [
              AnimatedFlipCounter(
                duration: const Duration(milliseconds: 1500),
                value: Random().nextInt(999),
                textStyle: _titleStyle,
                curve: Curves.easeOutCirc,
              ),
              SizedBox(height: EternalMargin.smallMargin),
              Wrap(
                spacing: EternalMargin.miniMargin,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.diversity_3, color: Colors.blueAccent, size: EternalIconSize.smallSize),
                  Text("粉丝", style: _secondTextStyle)
                ],
              ),
            ]),
          ),
          divider,
          InkWell(
            onTap: () => EternalNavigatorRoute.push(context, const PersonSideAttention()),
            child: Column(children: [
              AnimatedFlipCounter(
                duration: const Duration(milliseconds: 1500),
                value: Random().nextInt(99),
                textStyle: _titleStyle,
                curve: Curves.easeOutCirc,
              ),
              SizedBox(height: EternalMargin.smallMargin),
              Wrap(
                spacing: EternalMargin.miniMargin,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.face_6, color: Colors.yellow, size: EternalIconSize.smallSize),
                  Text("关注", style: _secondTextStyle)
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
