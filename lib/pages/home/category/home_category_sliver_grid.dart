import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/inherited/home/home_attention_widget.dart';
import 'package:flutter_04/pages/home/category/home_category_card_body.dart';
import 'package:flutter_04/pages/home/category/home_category_simple_details.dart';
import 'package:flutter_04/pages/home/details/home_details.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomeCategorySliverGrid extends StatefulWidget {
  int num;

  HomeCategorySliverGrid({super.key, required this.num});

  @override
  State<HomeCategorySliverGrid> createState() => _HomeCategorySliverGridState();
}

class _HomeCategorySliverGridState extends State<HomeCategorySliverGrid> with TickerProviderStateMixin {
  static int dataNum = 10;

  // int crossAxisCount = 2;
  double crossAxisSpacing = EternalMargin.miniMargin;
  double mainAxisSpacing = EternalMargin.miniMargin;

  //发布订阅模式，弊端，页面init时不会获取到最新的值，故父组件传值给子组件用inherited方式
  // late StreamSubscription subscription;

  late bool isGroupView = true;

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

    // subscription = bus.on<HomeGridEvent>().listen((event) {
    //   setState(() {
    //     isGroupView = event.isFlag;
    //     print("订阅数据：${isGroupView}");
    //   });
    // });

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
    // subscription.cancel();
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
    ///接收父组件传来的值
    isGroupView = HomeAttentionWidget.of(context).isGroupView;
    // print("inherited：${isGroupView}");
    return SliverWaterfallFlow(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
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
              child: Transform.translate(
                //动画方向
                offset: Offset(0, slideDistance),
                child: child,
              ),
            );
          },
          child: InkWell(
            onTap: () {
              EternalNavigatorRoute.push(context, const HomeDetails());
            },
            child: CachedNetworkImage(
              imageUrl: EternalConstants.getImage(),
              height: imageHeight < 180 ? 180 : imageHeight,
              placeholder: (context, url) => const LinearProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: HomeCategoryCardBody(),

                      ///模糊（非常耗性能，造成页面严重卡顿）
                      // child: BackdropFilter(
                      //   filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      //   child: HomeCategoryCardBody(),
                      // ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }, childCount: widget.num),
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: isGroupView ? 2 : 1,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        collectGarbage: (List<int> garbages) {
          // print('collect garbage : $garbages');
        },
        viewportBuilder: (int firstIndex, int lastIndex) {
          // print('viewport : [$firstIndex,$lastIndex]');
        },
      ),
    );

    // return SliverGrid(
    //   delegate: SliverChildBuilderDelegate(
    //     (BuildContext context, int index) {
    //       return AnimatedBuilder(
    //           animation: _staggeredController,
    //           builder: (context, child) {
    //             //每个元素使用的动画（规定了20个动画，通过 取余得到每元素每次使用的动画）
    //             final animationPercent = Curves.easeInOutQuart.transform(
    //               _itemSlideIntervals[index % 20].transform(_staggeredController.value),
    //             );
    //             final opacity = animationPercent;
    //             //每个动画间隔
    //             final slideDistance = (1.0 - animationPercent) * 10.0;
    //
    //             return Opacity(
    //               opacity: opacity,
    //               child: Transform.translate(
    //                 //动画方向
    //                 offset: Offset(0, slideDistance),
    //                 child: child,
    //               ),
    //             );
    //           },
    //           child: InkWell(
    //             onTap: () {
    //               EternalNavigatorRoute.push(context, HomeDetails());
    //               // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeDetails()));
    //             },
    //             child: Container(
    //                 clipBehavior: Clip.hardEdge,
    //                 decoration: BoxDecoration(
    //                     image: DecorationImage(image: NetworkImage(EternalConstants.imageUrl), fit: BoxFit.cover),
    //                     borderRadius: BorderRadius.all(Radius.circular(5)),
    //                     boxShadow: const [
    //                       BoxShadow(
    //                           color: Colors.black38,
    //                           offset: Offset(0.0, 4.0), //阴影xy轴偏移量
    //                           blurRadius: 5.0, //阴影模糊程度
    //                           spreadRadius: -4.0 //阴影扩散程度
    //                           )
    //                     ]),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Container(
    //                       width: double.infinity,
    //                       alignment: Alignment.topRight,
    //                       child: Material(
    //                         color: Colors.transparent,
    //                         child: IconButton(
    //                           onPressed: () {},
    //                           icon: const Icon(
    //                             Icons.double_arrow_rounded,
    //                             shadows: [
    //                               BoxShadow(
    //                                   color: Colors.black38,
    //                                   offset: Offset(0.0, 1.0),
    //                                   blurRadius: 0.5,
    //                                   spreadRadius: 1.0)
    //                             ],
    //                           ),
    //                           splashRadius: 20,
    //                           splashColor: Colors.black26,
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       clipBehavior: Clip.hardEdge,
    //                       margin: EdgeInsets.all(EternalMargin.miniMargin),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                       child: HomeCategoryCardBody(),
    //                       // child: BackdropFilter(
    //                       //   filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    //                       //   child: HomeCategoryCardBody(),
    //                       // ),
    //                     )
    //                   ],
    //                 )),
    //           ));
    //     },
    //     childCount: widget.num,
    //   ),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: isGroupView ? 2 : 1,
    //     crossAxisSpacing: EternalMargin.miniMargin,
    //     mainAxisSpacing: EternalMargin.miniMargin,
    //     childAspectRatio: isGroupView ? 3 / 4 : 16 / 9,
    //   ),
    // );
  }

//父组件值变化，子组件更新
  @override
  void didUpdateWidget(covariant HomeCategorySliverGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
