import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/category/home_category_simple_details.dart';
import 'package:flutter_04/pages/home/details/home_details.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import 'home_fire_body_content.dart';
import 'home_fire_body_image.dart';

class HomeFireSliverGrid extends StatefulWidget {
  int num;

  HomeFireSliverGrid({Key? key, required this.num}) : super(key: key);

  @override
  _HomeFireSliverGridState createState() => _HomeFireSliverGridState();
}

class _HomeFireSliverGridState extends State<HomeFireSliverGrid> with TickerProviderStateMixin {
  late AnimationController _controller;

  final List<Positioned> _userAvatarList = [];

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
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            // height: 500,
            margin: EdgeInsets.only(bottom: EternalMargin.smallMargin),
            padding: EdgeInsets.all(EternalPadding.smallPadding),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: EternalColors.boxDefaultColor,
              border: Border.all(color: EternalColors.unSelectColor, width: 0.2),
            ),
            child: InkWell(
              onTap: () {
                EternalNavigatorRoute.push(context, const HomeDetails());
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          InkWell(
                              onTap: () => EternalNavigatorRoute.push(context, const HomeDetailsTwo()),
                              child: Wrap(
                                spacing: EternalMargin.smallMargin,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  ///作者头像
                                  CircleAvatar(backgroundImage: NetworkImage(EternalConstants.getImage()), radius: 25),
                                  Wrap(
                                    direction: Axis.vertical,
                                    spacing: EternalMargin.miniMargin,
                                    children: [
                                      Text("ETERNAL", style: TextStyle(fontSize: EternalFontSize.regular(), fontWeight: FontWeight.bold)),

                                      ///时间
                                      Wrap(
                                        spacing: EternalMargin.miniMargin,
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          Icon(Icons.access_time, size: EternalIconSize.miniSize, color: EternalColors.textColor),
                                          Text(
                                            EternalConstants.getCurrentTime(),
                                            style: TextStyle(fontSize: EternalFontSize.small(), color: EternalColors.textColor),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),

                      ///更多信息弹窗
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.hardEdge,
                        child: IconButton(
                          icon: const Icon(Icons.more_vert_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              ModalSheetRoute(
                                transitionDuration: const Duration(milliseconds: 400),
                                builder: (context) => HomeCategorySimpleDetails(),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: EternalMargin.smallMargin),

                  ///图片主体
                  const HomeFireBodyImage(),
                  SizedBox(height: EternalMargin.smallMargin),

                  ///内容
                  const HomeFireBodyContent(),
                ],
              ),
            ),
          );
        },
        childCount: widget.num,
      ),
      // itemExtent: 250,
    );
  }
}
