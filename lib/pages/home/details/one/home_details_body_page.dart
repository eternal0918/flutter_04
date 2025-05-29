//内容组件
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/components/eternal_remark_comment.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

import 'home_details_content.dart';
import 'home_details_remark_second.dart';
import 'home_details_tags.dart';

class HomeDetailsBodyPage extends StatefulWidget {
  const HomeDetailsBodyPage({super.key});

  @override
  State<HomeDetailsBodyPage> createState() => _HomeDetailsBodyPageState();
}

class _HomeDetailsBodyPageState extends State<HomeDetailsBodyPage> {
  final GlobalKey<NestedScrollViewState> _key = GlobalKey<NestedScrollViewState>();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        key: _key,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500,
              leading: Text(""),
              floating: false,
              pinned: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(EternalConstants.randomImageUrl, fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(EternalPadding.smallPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///文本内容
                        HomeDetailsContent(),
                        SizedBox(height: 10),

                        ///标签
                        HomeDetailsTags(),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        Text("共 ${Random().nextInt(100)} 条评论", style: TextStyle(color: EternalColors.selectColor)),
                        SizedBox(height: 15),

                        ///详情 二级评论区域
                        HomeDetailsRemarkSecond(),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return EternalRemarkComment(
                            index: index,
                            dataList: null,
                          );
                        },
                        childCount: 50,
                      ),
                    ))
              ],
            );
          },
        ));
  }
}
