import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/search/home_search.dart';
import 'package:flutter_04/pages/login/login_page.dart';
import 'package:flutter_04/pages/person/collect/person_collect.dart';
import 'package:flutter_04/pages/person/other/person_other.dart';

import 'index/person_index_body.dart';
import 'index/person_index_card.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> with TickerProviderStateMixin {
  ///appBar 背景色
  Color _appBarBgColor = Colors.transparent;
  final ScrollController _scrollController = ScrollController(); // 初始化滚动监听器，加载更多使用

  ///滑动距离
  double _scrollHeight = 0;

  ///是否打开侧栏 flag
  bool _openFlag = true;

  ///当前tab页
  int _currentTabIndex = 0;

  ///tab控制器
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    ///监听 tabbar的滑动和点击事件
    _tabController = TabController(initialIndex: _currentTabIndex, vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });

    // 1、监听_scrollController，判断滑动距离是否超过appBar的高度，并修改其背景透明度
    _scrollController.addListener(() {
      _scrollHeight = _scrollController.position.pixels;
      if (_scrollHeight > 200 && _scrollHeight < 300) {
        setState(() {
          _appBarBgColor = Color.fromRGBO(28, 31, 36, _scrollHeight / 300);
        });

        // print("滑动：$scrollHeight=${_scrollController.position.maxScrollExtent}=${scrollHeight / 300}");
      }
      if (_scrollHeight < 200 && _scrollHeight > 0) {
        setState(() {
          _appBarBgColor = const Color.fromRGBO(28, 31, 36, 0);
        });
      }
      if (_scrollHeight > 300) {
        setState(() {
          _appBarBgColor = const Color.fromRGBO(28, 31, 36, 1);
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Stack(
        children: [
          Positioned(child: Container(color: EternalColors.defaultColor)),
          Positioned(
            child: NestedScrollView(
                // 2.使用滑动控制器
                controller: _scrollController,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      // stretch: true,
                      // stretchTriggerOffset: 100,
                      // onStretchTrigger: () {
                      //   print("打印");
                      //   return setAppBarBgColor();
                      // },
                      pinned: true,
                      backgroundColor: _appBarBgColor,
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
                      // elevation: 0,
                      leading: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.circle_notifications),
                        splashRadius: 20,
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {
                            EternalNavigatorRoute.push(context, HomeSearch());
                          },
                          icon: const Icon(Icons.search_rounded),
                          splashRadius: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings),
                          splashRadius: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            EternalNavigatorRoute.push(context, LoginPage());
                          },
                          icon: const Icon(Icons.logout),
                          splashRadius: 20,
                        )
                      ],
                      expandedHeight: 370,
                      flexibleSpace: FlexibleSpaceBar(
                        expandedTitleScale: 1.2,
                        // collapseMode: CollapseMode.pin,
                        background: Stack(
                          children: [
                            ///head部分背景
                            Positioned(
                              child: Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                                    image: DecorationImage(
                                        image: NetworkImage(EternalConstants.randomImageUrl),
                                        fit: BoxFit.cover,
                                        colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcOver))),
                              ),
                            ),

                            ///用户头像
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: EternalPadding.smallPadding,
                                  right: EternalPadding.smallPadding,
                                  top: 110,
                                ),
                                child: Column(
                                  children: const [
                                    // Text("${EternalConstants.appBarAndStatusBarHeight}"),

                                    ///头像卡片
                                    PersonIndexCard()
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        title: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            children: [
                              AnimatedContainer(
                                  // padding: EdgeInsets.only(left: EternalPadding.smallPadding),
                                  decoration: const BoxDecoration(color: EternalColors.defaultColor),
                                  clipBehavior: Clip.hardEdge,
                                  height: 30,
                                  width: _currentTabIndex == 0 ? 30 : 0,
                                  curve: Curves.easeOutCirc,
                                  duration: const Duration(milliseconds: 1500),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _openFlag = !_openFlag;
                                            });
                                          },
                                          icon: const Icon(Icons.clear_all),
                                          padding: EdgeInsets.zero))),
                              Expanded(
                                child: Material(
                                  color: EternalColors.defaultColor,
                                  child: TabBar(
                                    controller: _tabController,
                                    splashBorderRadius: BorderRadius.circular(10),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicatorColor: EternalColors.getPrimaryColor(),
                                    unselectedLabelColor: EternalColors.secondTextColor,
                                    tabs: const [
                                      Tab(child: Text("主页", style: TextStyle(fontSize: 12))),
                                      Tab(child: Text("收藏", style: TextStyle(fontSize: 12))),
                                      Tab(child: Text("其他", style: TextStyle(fontSize: 12))),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  physics: _currentTabIndex == 0 ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
                  children: [
                    PersonIndexBody(openFlag: _openFlag),
                    const PersonCollect(),
                    const PersonOther(),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Future<void> setAppBarBgColor() async {
    setState(() {
      _appBarBgColor = EternalColors.defaultColor;
    });
  }
}

// 自定义梯形切角
class TrapezoidPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 200); //x,y坐标
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
