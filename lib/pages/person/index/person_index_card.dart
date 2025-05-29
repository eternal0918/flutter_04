import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

class PersonIndexCard extends StatefulWidget {
  const PersonIndexCard({super.key});

  @override
  State<PersonIndexCard> createState() => _PersonIndexCardState();
}

class _PersonIndexCardState extends State<PersonIndexCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(EternalPadding.defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: EternalColors.unSelectColor, width: 1),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
      clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///左侧 简介
                  Wrap(
                    direction: Axis.vertical,
                    spacing: EternalMargin.smallMargin,
                    children: [
                      const Text(
                        "ETERNAL",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),
                      ),
                      Wrap(
                        children: const [
                          Text("ID : ", style: TextStyle(fontSize: 15, color: EternalColors.titleColor)),
                          Text(
                            "1728456478",
                            style: TextStyle(fontSize: 15, color: EternalColors.titleColor, fontFamily: "IMPACT"),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text("编辑个人信息 ", style: TextStyle(fontSize: 12, color: EternalColors.titleColor)),
                            Icon(Icons.arrow_right, size: EternalIconSize.smallSize, color: EternalColors.titleColor)
                          ],
                        ),
                      )
                    ],
                  ),
                  //右侧头像
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      image: DecorationImage(image: NetworkImage(EternalConstants.imageUrl), fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
              SizedBox(height: EternalMargin.smallMargin),
              const SizedBox(
                width: double.infinity,
                child: Text("每一个裂缝都是为透出光而努力", style: TextStyle(fontSize: 13, letterSpacing: 1)),
              ),
              SizedBox(height: EternalMargin.defaultMargin),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: EternalPadding.miniPadding),
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.diversity_3,
                        color: Colors.white,
                        size: EternalIconSize.largeSize,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        child: Column(
                          children: const [
                            Text("新朋友", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text("没有新通知", style: TextStyle(fontSize: 13, color: Colors.white70))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: EternalMargin.defaultMargin),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: EternalPadding.miniPadding),
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.animation,
                        color: Colors.white,
                        size: EternalIconSize.largeSize,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        child: Column(
                          children: const [
                            Text("互动消息", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text("ETERNAL 赞了你👍", style: TextStyle(fontSize: 13, color: Colors.white70))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
