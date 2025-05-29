import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/components/eternal_alert_dialog.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';

class HomeSearchSliverList extends StatefulWidget {
  int num;

  HomeSearchSliverList({Key? key, required this.num}) : super(key: key);

  @override
  _HomeSearchSliverListState createState() => _HomeSearchSliverListState();
}

class _HomeSearchSliverListState extends State<HomeSearchSliverList> with SingleTickerProviderStateMixin {
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
    return SliverList(
      ///子条目布局构建代理
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, num index) {
          ///子条目的布局样式
          return InkWell(
            onTap: () {
              EternalNavigatorRoute.push(context, HomeDetailsTwo());
            },
            child: Container(
              margin: EdgeInsets.only(bottom: EternalMargin.smallMargin),
              padding: EdgeInsets.all(EternalPadding.smallPadding),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: EternalColors.boxDefaultColor,
                border: Border.all(color: EternalColors.unSelectColor, width: 0.2),
              ),
              child: Row(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(EternalConstants.getImage()), radius: 30),
                  SizedBox(
                    width: EternalMargin.smallMargin,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          direction: Axis.vertical,
                          spacing: EternalMargin.miniMargin,
                          children: [
                            const Text(
                              "ETERNAL",
                              style: TextStyle(
                                fontSize: 15,
                                color: EternalColors.titleColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Text("ID : ${Random().nextInt(999999999)}",
                                style:
                                    const TextStyle(fontSize: 12, color: EternalColors.textColor, letterSpacing: 0.5)),
                            Text(
                              "作品 · ${Random().nextInt(999)} | 粉丝 · ${Random().nextInt(999)}",
                              style: const TextStyle(fontSize: 12, color: EternalColors.textColor, letterSpacing: 0.5),
                            ),
                          ],
                        ),

                        ///关注按钮
                        SearchAttentionButton(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },

        ///子条目的个数
        childCount: widget.num,
      ),
    );
  }
}

class SearchAttentionButton extends StatefulWidget {
  const SearchAttentionButton({super.key});

  @override
  State<SearchAttentionButton> createState() => _SearchAttentionButtonState();
}

class _SearchAttentionButtonState extends State<SearchAttentionButton> {
  String title = "求关注";
  bool titleFlag = false;
  IconData icon = Icons.add_rounded;
  Color bgColor = Colors.white;
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOutBack,
      transitionBuilder: (child, anim) {
        return ScaleTransition(scale: anim, child: child);
      },
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton.icon(
        key: ValueKey(titleFlag),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(),
          backgroundColor: bgColor,
        ),
        icon: Icon(icon, color: textColor),
        label: Text(title, style: TextStyle(color: textColor)),
        onPressed: () {
          setState(() {
            if (titleFlag) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EternalAlertDialog(
                      titleIcon: const Icon(Icons.error_rounded),
                      title: "提示",
                      content: const Center(heightFactor: 1, child: Text("确定取消关注吗？")),
                      cancelContent: const Text("取消"),
                      confirmContent: const Text("确认"),
                      confirm: () {
                        Navigator.of(context).pop();
                        setState(() {
                          titleFlag = false;
                          title = "求关注";
                          icon = Icons.add_rounded;
                          bgColor = Colors.white;
                          textColor = Colors.black;
                        });
                      },
                      cancel: () {
                        Navigator.of(context).pop();
                      },
                    );
                  });
            } else {
              titleFlag = true;
              title = "已关注";
              icon = Icons.done_all;
              bgColor = EternalColors.getPrimaryColor();
              textColor = Colors.white;
            }
          });
        },
      ),
    );
  }
}
