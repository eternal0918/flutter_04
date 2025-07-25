import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/notification/home/home_title_notification.dart';
import 'package:flutter_04/pages/create/create_page.dart';
import 'package:flutter_04/pages/home/drawer/home_drawer.dart';
import 'package:flutter_04/pages/home/endDrawer/home_end_drawer.dart';
import 'package:flutter_04/pages/home/home_page.dart';
import 'package:flutter_04/pages/home/search/home_search.dart';
import 'package:flutter_04/pages/message/message_page.dart';
import 'package:flutter_04/pages/person/person_page.dart';
import 'package:flutter_04/pages/release/release_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> with TickerProviderStateMixin {
  ///tab标记索引
  int _countIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CreatePage(),
    ReleasePage(),
    MessagePage(),
    PersonPage(),
  ];

  ///标题
  String title = "热门";

  ///是否有新的通知
  bool isNotifyLabel = true;

  // //创建动画所需要的 controller
  // late AnimationController _scaleAnimationController;
  //
  // //曲线动画
  // late CurvedAnimation curvedAnimation;
  //
  // //动画帧
  // late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // _scaleAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    // //曲线动画
    // curvedAnimation = CurvedAnimation(parent: _scaleAnimationController, curve: Curves.easeInOutBack);
    // //设置 补间动画
    // animation = Tween(begin: 1.2, end: 0.8).animate(curvedAnimation);
  }

  @override
  void dispose() {
    super.dispose();
    // _scaleAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<HomeTitleNotification>(
        onNotification: (notification) {
          setState(() {
            title = notification.title;
          });
          return true;
        },
        child: Scaffold(
          backgroundColor: EternalColors.defaultColor,
          drawer: _countIndex == 0 ? const HomeDrawer() : null,
          endDrawer: _countIndex == 0 ? const HomeEndDrawer() : null,
          appBar: _countIndex == 0
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: AppBar(
                    backgroundColor: EternalColors.defaultColor,
                    elevation: 0,
                    title: Text(title, style: const TextStyle(color: EternalColors.titleColor)),
                    leading: Builder(
                      builder: (context) =>
                          IconButton(icon: const Icon(Icons.sort_rounded), splashRadius: 20, onPressed: () => Scaffold.of(context).openDrawer()),
                    ),
                    actions: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: OutlinedButton.icon(
                          onPressed: () => EternalNavigatorRoute.push(context, HomeSearch()),
                          label: Text("搜索", style: TextStyle(fontSize: EternalFontSize.base())),
                          style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                          icon: Icon(LucideIcons.search, size: EternalIconSize.smallSize),
                        ),
                      ),
                      Builder(
                        builder: (context) => IconButton(
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                          splashRadius: 20,
                          icon: Badge(isLabelVisible: isNotifyLabel, child: const Icon(Icons.circle_notifications_rounded)),
                        ),
                      )
                    ],
                  ),
                )
              : null,
          body: _pages[_countIndex],

          ///根据 page的索引 找到数组里对应的page
          bottomNavigationBar: NavigationBar(
            backgroundColor: EternalColors.defaultColor,
            shadowColor: EternalColors.selectColor,
            height: 60,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            onDestinationSelected: (int index) {
              setState(() {
                _countIndex = index;
                //当选中的taps索引下标不为2时，触发返回动画
                // _countIndex != 2 ? _scaleAnimationController.reverse() : _scaleAnimationController.forward();
              });
            },
            selectedIndex: _countIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.deck_rounded, color: EternalColors.selectColor),
                icon: Badge(child: Icon(Icons.deck_outlined, color: EternalColors.unSelectColor)),
                label: '广场',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.design_services_rounded),
                icon: Icon(Icons.design_services_rounded),
                label: '创作',
              ),
              NavigationDestination(
                icon: Icon(Icons.switch_access_shortcut_add_rounded),
                label: '发布',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.drafts_rounded),
                icon: Badge(label: Text('2', style: TextStyle(color: EternalColors.titleColor)), child: Icon(Icons.mark_email_unread_rounded)),
                label: '消息',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.insert_emoticon_rounded),
                icon: Icon(Icons.face_6_rounded),
                label: '我的',
              ),
            ],
          ),
          // floatingActionButton: ScaleTransition(
          //   scale: animation,
          //   alignment: Alignment.center,
          //   child: Container(
          //     margin: EdgeInsets.only(top: 20),
          //     child: FloatingActionButton(
          //       elevation: 2,
          //       backgroundColor: _countIndex == 2 ?  EternalColors.getPrimaryColor() : EternalColors.defaultColor,
          //       onPressed: () {
          //         setState(() {
          //           _countIndex = 2;
          //           _scaleAnimationController.forward();
          //         });
          //       },
          //       child: Icon(
          //         // Icons.bubble_chart_rounded,
          //         // Icons.auto_awesome_rounded,
          //         Icons.switch_access_shortcut_add_rounded,
          //         color: _countIndex == 2 ? Colors.white : EternalColors.selectColor,
          //         size: 30,
          //       ),
          //     ),
          //   ),
          // ),

          // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        ));
  }
}
