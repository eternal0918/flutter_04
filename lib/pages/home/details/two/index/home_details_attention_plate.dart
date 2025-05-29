import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/constants/eternal_shadow.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';

class HomeDetailsAttentionPlate extends StatefulWidget {
  const HomeDetailsAttentionPlate({Key? key}) : super(key: key);

  @override
  _HomeDetailsAttentionPlateState createState() => _HomeDetailsAttentionPlateState();
}

class _HomeDetailsAttentionPlateState extends State<HomeDetailsAttentionPlate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      decoration: BoxDecoration(
        color: EternalColors.boxDefaultColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: EternalColors.unSelectColor, width: 0.2),
        boxShadow: EternalShadow.cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(
              vertical: EternalPadding.smallPadding,
              horizontal: EternalPadding.defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TA关注的人",
                  style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.arrow_forward_ios_rounded, size: EternalIconSize.smallSize),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                ///关注用户头像
                return InkWell(
                  onTap: () {
                    EternalNavigatorRoute.push(context, HomeDetailsTwo());
                  },
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: EternalMargin.smallMargin,
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage(EternalConstants.getImage()), radius: 35),
                      Text("ETERNAL")
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: EternalMargin.defaultMargin);
              },
              itemCount: 30,
            ),
          )
        ],
      ),
    );
  }
}
