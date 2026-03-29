//内容组件
import 'dart:math';
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/components/eternal_remark_comment.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:vibration/vibration.dart';

import '../../../../constants/eternal_font_size.dart';
import '../two/home_details_two.dart';
import 'home_details_content.dart';
import 'home_details_header_right.dart';
import 'home_details_remark_second.dart';
import 'home_details_tags.dart';

class HomeDetailsBodyPage extends StatefulWidget {
  final ValueChanged<bool> onScrollFlagChanged;

  HomeDetailsBodyPage({super.key, required this.onScrollFlagChanged});

  @override
  State<HomeDetailsBodyPage> createState() => _HomeDetailsBodyPageState();
}

class _HomeDetailsBodyPageState extends State<HomeDetailsBodyPage> {
  final GlobalKey<NestedScrollViewState> _key = GlobalKey<NestedScrollViewState>();

  ///滚动控制器
  late ScrollController _scrollController;

  // FlexibleSpaceBar 关闭标识
  bool _isFlexibleSpaceBarClosed = false;

  late SwipableStackController _stackController;

  // void _listenController() => setState(() {});
  final List<Widget> _cards = [];

  Color _headBgColor = Colors.black12;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _stackController = SwipableStackController();
    // _controller = SwipableStackController()..addListener(_listenController);
    super.initState();
    for (int i = 0; i < 20; i++) {
      _cards.add(Image.network(EternalConstants.getImage(), fit: BoxFit.cover));
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  ///滑动触发
  void _onScroll() {
    // print("偏移量：${_scrollController.offset}");
    // print("最大值：${_scrollController.position.maxScrollExtent}");
    // print("实际最大值：${_scrollController.position.maxScrollExtent - EternalConstants.appBarAndStatusBarHeight}");
    // 判断 FlexibleSpaceBar 是否关闭
    if (_scrollController.offset >= (_scrollController.position.maxScrollExtent - EternalConstants.appBarAndStatusBarHeight)) {
      if (!_isFlexibleSpaceBarClosed) {
        setState(() {
          _isFlexibleSpaceBarClosed = true;
          widget.onScrollFlagChanged(_isFlexibleSpaceBarClosed);
          _headBgColor = Colors.transparent;
          // print("透明");
        });
      }
    } else {
      if (_isFlexibleSpaceBarClosed) {
        setState(() {
          _isFlexibleSpaceBarClosed = false;
          widget.onScrollFlagChanged(_isFlexibleSpaceBarClosed);
          _headBgColor = Colors.black12;
          // print("白色");
        });
      }
    }
  }

  ///切换指定图片方法
  void jumpToIndex(int index) {
    _stackController.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: _key,
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          ///设置头部
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.width / 3 * 4,
            floating: true,
            pinned: true,
            backgroundColor: EternalColors.defaultColor,
            leadingWidth: 300,
            leading: Row(
              children: [
                SizedBox(width: EternalMargin.smallMargin),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: _isFlexibleSpaceBarClosed ? 0 : 5, sigmaY: _isFlexibleSpaceBarClosed ? 0 : 5),
                    child: Container(
                      padding: EdgeInsets.only(right: EternalPadding.normalPadding),
                      color: _headBgColor,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          ///头像
                          IconButton(icon: const Icon(Icons.arrow_back), splashRadius: 20, onPressed: () => Navigator.of(context).pop()),
                          OpenContainer(
                            transitionType: ContainerTransitionType.fade,
                            transitionDuration: const Duration(milliseconds: 300),
                            closedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            openBuilder: (BuildContext context, VoidCallback _) {
                              return const HomeDetailsTwo();
                            },
                            closedElevation: 0.0,
                            closedColor: Colors.transparent,
                            middleColor: Colors.transparent,
                            closedBuilder: (BuildContext context, VoidCallback openContainer) {
                              return Wrap(
                                spacing: EternalMargin.smallMargin,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  CircleAvatar(backgroundImage: NetworkImage(EternalConstants.imageUrl), radius: 20),
                                  Wrap(
                                    spacing: EternalMargin.miniMargin,
                                    direction: Axis.vertical,
                                    children: [
                                      Text("Sisyphus", style: TextStyle(fontSize: EternalFontSize.medium())),
                                      Text("10:39", style: TextStyle(fontSize: EternalFontSize.base())),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            actions: [
              ///求关注
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: _headBgColor,
                        padding: EdgeInsets.only(left: EternalPadding.smallPadding),
                        child: const HomeDetailsHeaderRight(),
                      ),
                    ),
                  ),
                  SizedBox(width: EternalMargin.smallMargin),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              ///图片展示区域
              background: GestureDetector(
                child: SwipableStack(
                  detectableSwipeDirections: const {SwipeDirection.right, SwipeDirection.left, SwipeDirection.down, SwipeDirection.up},
                  controller: _stackController,
                  stackClipBehaviour: Clip.hardEdge,
                  allowVerticalSwipe: false,
                  onSwipeCompleted: (index, direction) {},
                  horizontalSwipeThreshold: 0.2,
                  verticalSwipeThreshold: 0.2,
                  // overlayBuilder: (context, properties) {
                  //   final opacity = min(properties.swipeProgress, 1.0);
                  //   final isRight = properties.direction == SwipeDirection.right;
                  //   return Opacity(
                  //     opacity: isRight ? opacity : 0,
                  //     child: FlutterLogo(),
                  //   );
                  // },
                  builder: (context, properties) {
                    final itemIndex = properties.index % _cards.length;
                    return Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 3 * 4,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 0.0), //阴影xy轴偏移量
                                  blurRadius: 10.0, //阴影模糊程度
                                  spreadRadius: 0 //阴影扩散程度
                                  )
                            ],
                            color: EternalColors.defaultColor),
                        child: _cards[itemIndex],
                      ),
                      Positioned(
                        right: 20,
                        bottom: 50,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: EternalPadding.miniPadding, horizontal: EternalPadding.smallPadding),
                          decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "${itemIndex + 1}/${_cards.length}",
                            style: TextStyle(color: Colors.white, fontSize: EternalFontSize.regular(), letterSpacing: 2),
                          ),
                        ),
                      )
                    ]);
                  },
                ),
                onLongPress: () => Vibration.vibrate(duration: 10, amplitude: 80),
                // onPanDown: (details) {
                //   print("开始拖动");
                // },
                // onHorizontalDragEnd: (d) {
                //   print("结束拖动");
                // },
              ),
            ),
          ),
        ];
      },
      body: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///图片生成参数内容
                        const HomeDetailsContent(),

                        SizedBox(height: EternalMargin.normalMargin),

                        ///详情 二级评论区域
                        const HomeDetailsRemarkSecond(),
                        SizedBox(height: EternalMargin.smallMargin),
                      ],
                    ),
                  ),
                ),
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return EternalRemarkComment(index: index, dataList: null);
                      },
                      childCount: 50,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
