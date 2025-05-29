import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
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
    return Column(
      children: [
        ExpansionTile(
          childrenPadding: EdgeInsets.only(left: EternalPadding.defaultPadding),
          backgroundColor: Colors.black12,
          collapsedIconColor: EternalColors.unSelectColor,
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
          title: Wrap(
            runSpacing: EternalMargin.miniMargin,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('昵称#$index', style: TextStyle(color: EternalColors.selectColor, fontSize: 12)),
                  SizedBox(height: EternalMargin.miniMargin),
                  Text(
                    '昭阳殿里恩爱绝，蓬莱宫中日月长。回头下望人寰处，不见长安见尘雾。${Random().nextInt(1000000000)}',
                    style: TextStyle(fontSize: 12, color: EternalColors.titleColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(EternalConstants.getCurrentTime(),
                      style: TextStyle(fontSize: 12, color: EternalColors.selectColor)),
                  Wrap(
                    children: [
                      SizedBox(
                        height: 20,
                        child: IconButton(
                          icon: Icon(Icons.send_rounded, size: EternalIconSize.smallSize),
                          padding: EdgeInsets.all(0.0),
                          splashRadius: 20,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: IconButton(
                          icon: Icon(Icons.favorite_outline, size: EternalIconSize.smallSize),
                          padding: EdgeInsets.all(0.0),
                          splashRadius: 20,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          leading: CircleAvatar(backgroundImage: NetworkImage(EternalConstants.randomImageUrl), radius: 20),
          children: List<Widget>.generate(5, (index) {
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(EternalConstants.randomImageUrl), radius: 15),
              title: Text("昵称", style: TextStyle(fontSize: 12, color: EternalColors.selectColor)),
              subtitle: Wrap(
                spacing: EternalMargin.smallMargin,
                children: [
                  Text("昭阳殿里恩爱绝，蓬莱宫中日月长。回头下望人寰处，不见长安见尘雾。",
                      style: TextStyle(color: EternalColors.titleColor, fontSize: 12)),
                  Text(EternalConstants.getCurrentTime(),
                      style: const TextStyle(fontSize: 12, color: EternalColors.selectColor)),
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
