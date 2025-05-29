//卡片内容
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';

class HomeCategoryCardBody extends StatefulWidget {
  const HomeCategoryCardBody({super.key});

  @override
  State<HomeCategoryCardBody> createState() => _HomeCategoryCardBodyState();
}

class _HomeCategoryCardBodyState extends State<HomeCategoryCardBody> {
  Color _favoriteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.all(EternalPadding.miniPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: EternalMargin.miniMargin),
            child: const Text(
              "治愈系画风丨原始探险荒野森林场景插画丨画风增强",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold, color: EternalColors.titleColor),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  EternalNavigatorRoute.push(context, HomeDetailsTwo());
                },
                child: Wrap(
                  spacing: EternalMargin.miniMargin,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ///头像 昵称
                    CircleAvatar(backgroundImage: NetworkImage(EternalConstants.getImage()), radius: 10),
                    const Text("ETERNAL", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              AnimatedSwitcher(
                switchInCurve: Curves.easeInOutBack,
                transitionBuilder: (child, anim) {
                  return ScaleTransition(scale: anim, child: child);
                },
                duration: const Duration(milliseconds: 300),
                child: InkWell(
                  key: ValueKey(_favoriteColor),
                  child: Wrap(
                    spacing: EternalMargin.miniMargin,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.favorite_rounded, size: 20, color: _favoriteColor),
                      Text("${Random().nextInt(999)}")
                    ],
                  ),
                  onTap: () {
                    // print("喜欢");
                    setState(() {
                      _favoriteColor == Colors.white ? _favoriteColor = Colors.red : _favoriteColor = Colors.white;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
