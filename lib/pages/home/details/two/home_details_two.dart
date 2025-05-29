import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/two/favorite/home_details_favorite.dart';
import 'package:flutter_04/pages/home/details/two/index/home_details_index.dart';
import 'package:flutter_04/pages/home/details/two/works/home_details_works.dart';

//用户详情页
class HomeDetailsTwo extends StatefulWidget {
  const HomeDetailsTwo({Key? key}) : super(key: key);

  @override
  _HomeDetailsTwoState createState() => _HomeDetailsTwoState();
}

class _HomeDetailsTwoState extends State<HomeDetailsTwo> {
  TextStyle titleStyle = const TextStyle(color: EternalColors.selectColor, fontSize: 12);
  TextStyle countStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: EternalColors.defaultColor,
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 350,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back), splashRadius: 20, onPressed: () => Navigator.of(context).pop()),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search_rounded),
                      splashRadius: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share_rounded),
                      splashRadius: 20,
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1.2,
                    centerTitle: true,
                    background: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(EternalConstants.randomImageUrl),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.grey.shade900.withOpacity(0.7), BlendMode.srcOver),
                        ),
                      ),

                      /// 用户主页 header
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: EternalConstants.appBarAndStatusBarHeight),
                          Wrap(
                            spacing: EternalMargin.defaultMargin,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              CircleAvatar(backgroundImage: NetworkImage(EternalConstants.imageUrl), radius: 40),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("ETERNAL", style: countStyle),
                                  SizedBox(height: EternalMargin.miniMargin),
                                  Text("ID：41047243", style: titleStyle),
                                  Text("♂",
                                      style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: EternalMargin.smallMargin),
                          Text("人生就像一只盒子，你想要什么，就要先放进去什么。"),
                          SizedBox(height: EternalMargin.smallMargin),
                          Row(
                            children: [
                              TextButton(
                                child: Row(children: [
                                  Text("${(Random().nextDouble() * 20).toStringAsPrecision(2)}w", style: countStyle),
                                  SizedBox(width: 5),
                                  Text("浏览", style: titleStyle)
                                ]),
                                onPressed: () {},
                              ),
                              TextButton(
                                child: Row(children: [
                                  Text("${Random().nextInt(9999)}", style: countStyle),
                                  SizedBox(width: 5),
                                  Text("获赞", style: titleStyle)
                                ]),
                                onPressed: () {},
                              ),
                              TextButton(
                                child: Row(children: [
                                  Text("${Random().nextInt(50)}", style: countStyle),
                                  SizedBox(width: 5),
                                  Text("关注", style: titleStyle)
                                ]),
                                onPressed: () {},
                              ),
                              TextButton(
                                child: Row(children: [
                                  Text("${Random().nextInt(9999)}", style: countStyle),
                                  SizedBox(width: 5),
                                  Text("粉丝", style: titleStyle)
                                ]),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: EternalMargin.smallMargin),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  icon: Icon(Icons.add_rounded, color: Colors.white),
                                  label: Text("关注", style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(backgroundColor:  EternalColors.getPrimaryColor()),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton.icon(
                                  icon: Icon(Icons.send_rounded),
                                  label: Text("私信"),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    title: Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.hardEdge,
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor:  EternalColors.getPrimaryColor(),
                            unselectedLabelColor: EternalColors.secondTextColor,
                            tabs: [
                              Tab(text: "主页"),
                              Tab(text: "作品"),
                              Tab(text: "喜欢"),
                            ],
                          )),
                    ),
                  ),
                ),
                // SliverList(
                //   delegate: SliverChildBuilderDelegate(
                //         (context, index) => ListTile(title: Text('Item #$index')),
                //     childCount: 1000,
                //   ),
                // ),
              ];
            },
            body: TabBarView(
              children: [
                HomeDetailsIndex(),
                HomeDetailsWorks(),
                HomeDetailsFavorite(),
              ],
            ),
          ),
        ));
  }
}
