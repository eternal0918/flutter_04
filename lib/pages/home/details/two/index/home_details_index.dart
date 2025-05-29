import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/one/home_details_one.dart';
import 'package:flutter_04/pages/home/details/two/index/home_details_attention_plate.dart';

import 'home_details_fire_plate.dart';

class HomeDetailsIndex extends StatefulWidget {
  const HomeDetailsIndex({Key? key}) : super(key: key);

  @override
  _HomeDetailsIndexState createState() => _HomeDetailsIndexState();
}

class _HomeDetailsIndexState extends State<HomeDetailsIndex> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: EternalPadding.defaultPadding,
        left: EternalPadding.smallPadding,
        right: EternalPadding.smallPadding,
        bottom: EternalPadding.smallPadding,
      ),
      child: CustomScrollView(
        slivers: [
          ///TA关注的人
          SliverToBoxAdapter(child: HomeDetailsAttentionPlate()),

          SliverToBoxAdapter(child: SizedBox(height: EternalMargin.defaultMargin)),

          ///TA的热门作品
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: EternalMargin.smallMargin),
              padding: EdgeInsets.symmetric(
                horizontal: EternalPadding.defaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "TA的热门作品",
                    style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Icon(Icons.arrow_forward_ios_rounded, size: EternalIconSize.smallSize),
                  )
                ],
              ),
            ),
          ),

          ///内容主体
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  EternalNavigatorRoute.push(context, HomeDetailsOne());
                },
                child: HomeDetailsFirePlate(index: index),
              );
            }, childCount: 2),
          )
        ],
      ),
    );
  }
}
