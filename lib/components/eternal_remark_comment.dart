import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

class EternalRemarkComment extends StatefulWidget {
  int index;
  var dataList;

  EternalRemarkComment({Key? key, required this.index, this.dataList}) : super(key: key);

  @override
  _EternalRemarkCommentState createState() => _EternalRemarkCommentState(index: index, dataList: dataList);
}

class _EternalRemarkCommentState extends State<EternalRemarkComment> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int index;
  var dataList;

  _EternalRemarkCommentState({required this.index, this.dataList});

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
    var mockData = EternalConstants.getMockData;
    return Column(
      children: [
        ExpansionTile(
          tilePadding: EdgeInsets.only(top: EternalPadding.miniPadding, left: EternalPadding.normalPadding, right: EternalPadding.normalPadding),
          childrenPadding: EdgeInsets.only(left: EternalPadding.defaultPadding, bottom: EternalPadding.smallPadding),
          backgroundColor: Colors.black26,
          collapsedIconColor: EternalColors.unSelectColor,
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
          title: Wrap(
            runSpacing: EternalMargin.miniMargin,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mockData.person.name(), style: TextStyle(color: EternalColors.selectColor, fontSize: EternalFontSize.base())),
                  SizedBox(height: EternalMargin.miniMargin),
                  Text(
                    EternalConstants.getMockData.lorem.sentence(),
                    style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.titleColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    EternalConstants.getCurrentTime(),
                    style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.selectColor),
                  ),
                  Wrap(
                    children: [
                      SizedBox(
                        height: 20,
                        child: IconButton(
                          icon: Icon(Icons.send_rounded, size: EternalIconSize.smallSize),
                          padding: EdgeInsets.zero,
                          splashRadius: EternalIconSize.smallSize,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: IconButton(
                          icon: Icon(Icons.favorite_outline, size: EternalIconSize.smallSize),
                          padding: EdgeInsets.zero,
                          splashRadius: EternalIconSize.smallSize,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          leading: CircleAvatar(backgroundImage: NetworkImage(EternalConstants.getImage()), radius: 20),
          children: List<Widget>.generate(5, (index) {
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(EternalConstants.getImage()), radius: 15),
              title: Text(mockData.person.name(), style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.selectColor)),
              subtitle: Wrap(
                spacing: EternalMargin.smallMargin,
                children: [
                  Text(mockData.lorem.sentence(), style: TextStyle(color: EternalColors.titleColor, fontSize: EternalFontSize.base())),
                  Text(EternalConstants.getCurrentTime(), style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.selectColor)),
                ],
              ),
              trailing: Wrap(
                children: [
                  SizedBox(
                    height: EternalMargin.defaultMargin,
                    child: IconButton(
                      icon: Icon(Icons.send_rounded, size: EternalIconSize.smallSize),
                      padding: EdgeInsets.all(0.0),
                      splashRadius: 20,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: EternalMargin.defaultMargin,
                    child: IconButton(
                      icon: Icon(Icons.favorite_outline, size: EternalIconSize.smallSize),
                      padding: EdgeInsets.all(0.0),
                      splashRadius: 20,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
