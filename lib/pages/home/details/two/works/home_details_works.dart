import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/one/home_details_one.dart';

class HomeDetailsWorks extends StatefulWidget {
  const HomeDetailsWorks({Key? key}) : super(key: key);

  @override
  _HomeDetailsWorksState createState() => _HomeDetailsWorksState();
}

class _HomeDetailsWorksState extends State<HomeDetailsWorks> with TickerProviderStateMixin {
  late AnimationController _controller;

  int _num = 20;
  bool _isLoding = false;
  bool _isRefreshing = false;
  String _loadingText = "查看更多";

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

  Future<String> _RrefreshPull() async {
    await Future.delayed(new Duration(seconds: 1));
    return "_RrefreshPull";
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification && notification.depth == 0 && !_isLoding && !_isRefreshing) {
            if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
              setState(() {
                _isLoding = true;
                _loadingText = "加载中.....";
                _num += 20;
              });
              _RrefreshPull().then((value) {
                setState(() {
                  _isLoding = false;
                });
              }).catchError((error) {
                setState(() {
                  _isLoding = true;
                  _loadingText = "加载失败.....";
                });
              });
            }
          }
          return _isLoding;
        },
        child: RefreshIndicator(
          onRefresh: () {
            if (_isLoding) ;
            return _RrefreshPull().then((value) {
              setState(() {
                _num += 20;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    duration: const Duration(milliseconds: 3000),
                    width: 280.0,
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    behavior: SnackBarBehavior.floating,
                    content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text("作品已更新到最新版", style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {},
                        child: Text("确认", style: TextStyle(color: Colors.white)),
                      )
                    ]),
                  ),
                );
              });
            }).catchError((error) {
              print('failed');
            });
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 2),
                sliver: HomeDetailsSliverGrid(num: _num),
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  visible: _isLoding,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: 100,
                    child: Center(
                      child: Text(_loadingText),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class HomeDetailsSliverGrid extends StatefulWidget {
  int num;

  HomeDetailsSliverGrid({super.key, required this.num});

  @override
  State<HomeDetailsSliverGrid> createState() => _HomeDetailsSliverGridState();
}

class _HomeDetailsSliverGridState extends State<HomeDetailsSliverGrid> with TickerProviderStateMixin {
  static int dataNum = 20;

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
    _createAnimationIntervals();
    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
    super.initState();
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
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return AnimatedBuilder(
                animation: _staggeredController,
                builder: (context, child) {
                  //每个元素使用的动画（规定了20个动画，通过 取余得到每元素每次使用的动画）
                  final animationPercent = Curves.easeInOutQuart.transform(
                    _itemSlideIntervals[index % 20].transform(_staggeredController.value),
                  );
                  final opacity = animationPercent;
                  //每个动画间隔
                  final slideDistance = (1.0 - animationPercent) * 10;

                  return Opacity(
                    opacity: opacity,
                    child: Transform.translate(
                      //动画方向
                      offset: Offset(0, slideDistance),
                      child: child,
                    ),
                  );
                },
                child: HomeDetailsWorksBody(index: index));
          },
          childCount: widget.num,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: EternalMargin.groupMargin,
          mainAxisSpacing: EternalMargin.groupMargin,
          childAspectRatio: 3 / 4,
        ));
  }
}

//内容
class HomeDetailsWorksBody extends StatefulWidget {
  int index;

  HomeDetailsWorksBody({super.key, required this.index});

  @override
  State<HomeDetailsWorksBody> createState() => _HomeDetailsWorksBodyState();
}

class _HomeDetailsWorksBodyState extends State<HomeDetailsWorksBody> {
  List<BoxShadow> shadow = const [
    BoxShadow(
        color: Colors.black54,
        offset: Offset(0.0, 1.0), //阴影xy轴偏移量
        blurRadius: 0.5, //阴影模糊程度
        spreadRadius: 1.0 //阴影扩散程度
        )
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        EternalNavigatorRoute.push(context, HomeDetailsOne());
      },
      child: Container(
        key: ValueKey(widget.index),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(EternalConstants.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "赛博朋克",
                style: TextStyle(fontSize: 10, color: Colors.white, fontStyle: FontStyle.italic),
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: EternalColors.getPrimaryColor().withOpacity(0.5),
                  shape: ContinuousRectangleBorder(),
                  minimumSize: Size(0, 0),
                  padding: EdgeInsets.symmetric(
                    horizontal: EternalPadding.smallPadding,
                    vertical: EternalPadding.miniPadding,
                  )),
            ),
            TextButton.icon(
              icon: Icon(Icons.play_arrow_rounded, size: EternalIconSize.defaultSize, shadows: shadow),
              onPressed: () {},
              label: Text(
                "${Random().nextInt(9999)}",
                style: TextStyle(shadows: shadow),
              ),
            )
          ],
        ),
      ),
    );
  }
}
