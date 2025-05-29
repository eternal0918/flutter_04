import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

import '../../../../constants/eternal_colors.dart';
import '../../../../constants/eternal_constants.dart';
import '../../../../constants/eternal_icon_size.dart';
import '../../../../constants/eternal_margin.dart';
import '../../../../constants/eternal_padding.dart';

class PersonSideScore extends StatefulWidget {
  const PersonSideScore({Key? key}) : super(key: key);

  @override
  _PersonSideScoreState createState() => _PersonSideScoreState();
}

class _PersonSideScoreState extends State<PersonSideScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      appBar: AppBar(
        backgroundColor: EternalColors.defaultColor,
        elevation: 0,
        title: const Text("我的积分"),
        actions: [
          SizedBox(
              height: 40,
              child: Row(children: [
                TextButton(onPressed: () {}, child: const Text("充值")),
                TextButton(onPressed: () {}, child: const Text("记录"))
              ])),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(EternalPadding.smallPadding),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// 积分卡片
            const SliverToBoxAdapter(child: SideScoreCard()),

            ///人物列表
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: EternalMargin.defaultMargin),

                  ///新用户任务
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        spacing: EternalMargin.smallMargin,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.accessibility_new_rounded,
                              color: Colors.greenAccent, size: EternalIconSize.defaultSize),
                          const Text(
                            "新用户任务",
                            style:
                                TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "一键领取",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: EternalColors.secondTextColor,
                            ),
                          ))
                    ],
                  ),

                  Container(
                    height: 300,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: EternalColors.boxDefaultColor,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: EternalColors.unSelectColor, width: 0.2)),
                    child: ListView.builder(
                      padding: EdgeInsets.all(EternalPadding.smallPadding),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading:
                              CircleAvatar(backgroundImage: NetworkImage(EternalConstants.randomImageUrl), radius: 20),
                          title: Wrap(
                            spacing: EternalMargin.smallMargin,
                            children: [
                              Wrap(
                                spacing: EternalMargin.smallMargin,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text("注册$index", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                  Icon(Icons.control_point_duplicate, size: EternalIconSize.defaultSize),
                                ],
                              ),
                              Text("+${Random().nextInt(100)}", style: const TextStyle(fontSize: 12))
                            ],
                          ),
                          subtitle: const Text("完成实名认证，即可获得100积分", style: TextStyle(fontSize: 12)),
                          trailing: SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                              child: const Text("去完成", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(height: EternalMargin.defaultMargin),

                  ///积分任务
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        spacing: EternalMargin.smallMargin,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.toll, color: Colors.orange, size: EternalIconSize.defaultSize),
                          const Text(
                            "积分任务",
                            style:
                                TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "一键领取",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: EternalColors.secondTextColor,
                            ),
                          ))
                    ],
                  ),

                  Container(
                    height: 300,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: EternalColors.boxDefaultColor,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: EternalColors.unSelectColor, width: 0.2)),
                    child: ListView.builder(
                      padding: EdgeInsets.all(EternalPadding.smallPadding),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading:
                              CircleAvatar(backgroundImage: NetworkImage(EternalConstants.randomImageUrl), radius: 20),
                          title: Wrap(
                            spacing: EternalMargin.smallMargin,
                            children: [
                              Wrap(
                                spacing: EternalMargin.smallMargin,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text("邀请好友注册$index",
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                  Icon(Icons.control_point_duplicate, size: EternalIconSize.defaultSize),
                                ],
                              ),
                              Text("+${Random().nextInt(100)}", style: const TextStyle(fontSize: 12))
                            ],
                          ),
                          subtitle: const Text("完成实名认证，即可获得100积分", style: TextStyle(fontSize: 12)),
                          trailing: SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                              child: const Text("去完成", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

///积分卡片
class SideScoreCard extends StatefulWidget {
  const SideScoreCard({super.key});

  @override
  State<SideScoreCard> createState() => _SideScoreCardState();
}

class _SideScoreCardState extends State<SideScoreCard> {
  int _score = 100000;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _score = Random().nextInt(9999);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(EternalPadding.defaultPadding),
      height: 125,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: ExactAssetImage("assets/images/bg/bg2.jpeg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcOver)),
        color: EternalColors.boxDefaultColor,
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: EternalColors.unSelectColor, width: 0.5),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Wrap(
              spacing: EternalMargin.smallMargin,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.fiber_smart_record_rounded, size: EternalIconSize.defaultSize),
                const Text("可用积分", style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Center(
            child: AnimatedFlipCounter(
              duration: const Duration(milliseconds: 1500),
              value: _score,
              textStyle: const TextStyle(fontSize: 70, fontFamily: "IMPACT"),
              curve: Curves.easeOutCirc,
            ),
          )
        ],
      ),
    );
  }
}
