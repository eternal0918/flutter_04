import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/search/two/total/home_search_total.dart';
import 'package:flutter_04/pages/home/search/two/user/home_search_user.dart';

class HomeSearchTwo extends StatefulWidget {
  const HomeSearchTwo({Key? key}) : super(key: key);

  @override
  _HomeSearchTwoState createState() => _HomeSearchTwoState();
}

class _HomeSearchTwoState extends State<HomeSearchTwo> with TickerProviderStateMixin {
  ///当前tab页
  int currentTabIndex = 0;

  ///tab控制器
  late TabController _tabController;

  ///选中的关键词下标
  int selectKeyIndex = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  double _height = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this)..forward();
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    ///监听 tabbar的滑动和点击事件
    _tabController = TabController(initialIndex: currentTabIndex, vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        currentTabIndex = _tabController.index;
        if (currentTabIndex == 1) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        // print("当前页面${currentTabIndex}========${_tabController.index}");
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (currentTabIndex == 1) {
        _height = 0;
      } else {
        _height = 40;
      }
    });
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  elevation: 0,
                  pinned: currentTabIndex == 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: EternalColors.defaultColor,
                  expandedHeight: currentTabIndex == 0 ? 100 : 0,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    background: Wrap(
                      children: [
                        TabBar(
                          controller: _tabController,
                          padding: EdgeInsets.only(bottom: EternalPadding.smallPadding),
                          isScrollable: true,
                          indicatorColor: EternalColors.getPrimaryColor(),
                          indicatorSize: TabBarIndicatorSize.label,
                          unselectedLabelColor: EternalColors.unSelectColor,
                          indicatorWeight: 2,
                          labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          unselectedLabelStyle: const TextStyle(fontSize: 15),
                          tabs: const [
                            Tab(text: "全部"),
                            Tab(text: "创作者"),
                          ],
                        )
                      ],
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, anim) {
                        return FadeTransition(opacity: _animation, child: child);
                      },
                      child: currentTabIndex == 0
                          ? Container(
                              margin: EdgeInsets.only(bottom: EternalPadding.smallPadding),
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                              clipBehavior: Clip.hardEdge,
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  bool flag = selectKeyIndex == index;

                                  ///关键词选择 切换动画
                                  return AnimatedSwitcher(
                                    switchInCurve: Curves.easeInOutBack,
                                    transitionBuilder: (child, anim) {
                                      return ScaleTransition(scale: anim, child: child);
                                    },
                                    duration: const Duration(milliseconds: 300),
                                    child: ElevatedButton(
                                      key: ValueKey(flag),
                                      onPressed: () {
                                        setState(() {
                                          selectKeyIndex = index;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: const StadiumBorder(),
                                        backgroundColor: selectKeyIndex == index
                                            ? EternalColors.boxDefaultColor
                                            : EternalColors.defaultColor,
                                      ),
                                      child: Text(
                                        "古风${index}",
                                        style: selectKeyIndex == index
                                            ? const TextStyle(
                                                color: EternalColors.titleColor, fontWeight: FontWeight.bold)
                                            : const TextStyle(color: EternalColors.secondTextColor),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 10,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: EternalPadding.miniPadding),
              child: TabBarView(
                controller: _tabController,
                children: [
                  HomeSearchTotal(),
                  HomeSearchUser(headHeight: _height),
                ],
              ),
            )));
  }
}
