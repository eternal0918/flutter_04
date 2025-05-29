import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/pages/home/category/home_category_card_body.dart';
import 'package:flutter_04/pages/home/category/home_category_simple_details.dart';
import 'package:flutter_04/pages/home/details/home_details.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomeSearchSliverGrid extends StatefulWidget {
  int num;

  HomeSearchSliverGrid({Key? key, required this.num}) : super(key: key);

  @override
  _HomeSearchSliverGridState createState() => _HomeSearchSliverGridState();
}

class _HomeSearchSliverGridState extends State<HomeSearchSliverGrid> with TickerProviderStateMixin {
  static int dataNum = 10;
  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  static const _initialDelayTime = Duration(milliseconds: 100);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 100);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final Duration _animationDuration = _initialDelayTime + (_staggerTime * dataNum) + _buttonDelayTime + _buttonTime;

  @override
  void initState() {
    super.initState();
    //初始化动画
    _createAnimationIntervals();
    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < dataNum; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverWaterfallFlow(
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: EternalMargin.miniMargin,
        mainAxisSpacing: EternalMargin.miniMargin,
        collectGarbage: (List<int> garbages) {
          // print('collect garbage : $garbages');
        },
        viewportBuilder: (int firstIndex, int lastIndex) {
          // print('viewport : [$firstIndex,$lastIndex]');
        },
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          ///容器高度
          double imageHeight = Random().nextInt(350).toDouble();
          return AnimatedBuilder(
            animation: _staggeredController,
            builder: (context, child) {
              //每个元素使用的动画（规定了20个动画，通过 取余得到每元素每次使用的动画）
              final animationPercent = Curves.easeInOutQuart.transform(
                _itemSlideIntervals[index % 10].transform(_staggeredController.value),
              );
              final opacity = animationPercent;
              //每个动画间隔
              final slideDistance = (1.0 - animationPercent) * 10.0;

              return Opacity(
                opacity: opacity,
                child: Transform.translate(offset: Offset(0, slideDistance), child: child), //动画方向
              );
            },
            child: InkWell(
              onTap: () {
                EternalNavigatorRoute.push(context, const HomeDetails());
              },
              child: Container(

                  ///元素高度
                  height: imageHeight < 180 ? 180 : imageHeight,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(EternalConstants.getImage()), fit: BoxFit.cover),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.0, 4.0), //阴影xy轴偏移量
                            blurRadius: 5.0, //阴影模糊程度
                            spreadRadius: -4.0 //阴影扩散程度
                            )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///简略详情
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topRight,
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return HomeCategorySimpleDetails();
                                  });
                            },
                            icon: const Icon(
                              Icons.more_horiz,
                              shadows: [
                                BoxShadow(
                                    color: Colors.black38, offset: Offset(0.0, 1.0), blurRadius: 0.5, spreadRadius: 1.0)
                              ],
                            ),
                            splashRadius: 20,
                            splashColor: Colors.black26,
                          ),
                        ),
                      ),

                      ///标题、头像
                      Container(
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.all(EternalMargin.miniMargin),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                        child: HomeCategoryCardBody(),
                      )
                    ],
                  )),
            ),
          );
        },
        childCount: widget.num,
      ),
    );
  }
}
