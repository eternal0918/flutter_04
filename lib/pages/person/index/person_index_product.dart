import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/one/home_details_one.dart';

///作品
class PersonIndexProduct extends StatelessWidget {
  const PersonIndexProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: EternalMargin.defaultMargin),
          padding: EdgeInsets.only(right: EternalPadding.smallPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: EternalMargin.smallMargin,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.auto_fix_high, color: Colors.deepPurpleAccent, size: EternalIconSize.smallSize),
                  Text(
                    "我的动态（${Random().nextInt(300)}）",
                    style: const TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Icon(Icons.arrow_forward_ios_rounded, size: EternalIconSize.smallSize),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(15))),
            clipBehavior: Clip.hardEdge,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(right: EternalPadding.defaultPadding),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                ///关注用户头像
                return InkWell(
                    onTap: () {
                      EternalNavigatorRoute.push(context, HomeDetailsOne());
                    },
                    child: CachedNetworkImage(
                      imageUrl: EternalConstants.getImage(),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LinearProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ));
              },
              itemCount: 30,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 4 / 3,
              ),
            ),
          ),
        )
      ],
    );
  }
}
