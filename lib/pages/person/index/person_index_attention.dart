import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';

class PersonIndexAttention extends StatefulWidget {
  const PersonIndexAttention({Key? key}) : super(key: key);

  @override
  _PersonIndexAttentionState createState() => _PersonIndexAttentionState();
}

class _PersonIndexAttentionState extends State<PersonIndexAttention> {
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
                  Icon(Icons.face_6, color: Colors.yellow, size: EternalIconSize.smallSize),
                  const Text("关注的人", style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold, fontSize: 15)),
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
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(right: EternalPadding.defaultPadding),
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
                  spacing: EternalMargin.normalMargin,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(50)),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: EternalConstants.getImage(),
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const Text("ETERNAL", style: TextStyle(fontSize: 11, color: EternalColors.textColor))
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
    );
  }
}
