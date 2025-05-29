import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/notification/home/home_title_notification.dart';
import 'package:flutter_04/pages/home/category/attention/home_attention.dart';
import 'package:flutter_04/pages/home/category/fire/home_fire.dart';
import 'package:flutter_04/pages/home/category/recommend/home_recommend.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(length: 3, child: HomeSquareContainer());
  }
}

class HomeSquareContainer extends StatefulWidget {
  const HomeSquareContainer({super.key});

  @override
  State<HomeSquareContainer> createState() => _HomeSquareContainerState();
}

class _HomeSquareContainerState extends State<HomeSquareContainer> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///监听 tabbar的滑动和点击事件
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(() {
      int index = tabController.index;
      String title = "";
      if (index == 0) {
        title = "热门";
      } else if (index == 1) {
        title = "推荐";
      } else {
        title = "关注";
      }
      HomeTitleNotification(title).dispatch(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          backgroundColor: EternalColors.defaultColor,
          elevation: 0,
          bottom: TabBar(
            controller: tabController,
            indicatorColor:  EternalColors.getPrimaryColor(),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: EternalColors.unSelectColor,
            labelColor:  EternalColors.getPrimaryColor(),
            indicatorWeight: 2,
            onTap: (index) {
              // String title = "";
              // if (index == 0) {
              //   title = "热门";
              // } else if (index == 1) {
              //   title = "推荐";
              // } else {
              //   title = "关注";
              // }
              // HomeTitleNotification(title).dispatch(context);
            },
            tabs:  [
              // Tab(text: "关注"),
              // Tab(text: "推荐"),
              SizedBox(height: 40, child: Icon(Icons.local_fire_department_rounded,size: EternalIconSize.defaultSize)),
              SizedBox(height: 40, child: Icon(Icons.recommend_rounded,size: EternalIconSize.defaultSize)),
              SizedBox(height: 40, child: Icon(Icons.smart_button_rounded,size: EternalIconSize.defaultSize)),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          HomeFire(),
          HomeRecommend(),
          DefaultTabController(length: 8, child: HomeAttention()),
        ],
      ),
    );
  }
}

// Row(children: [
//   AnimatedToggleSwitch<int>.rolling(
//     borderWidth: 4,
//     iconOpacity: 0.2,
//     onChanged: (i) => setState(() => {_currentIndex = i}),
//     current: _currentIndex,
//     values: [0, 1, 2, 3, 4, 5, 6],
//     iconList: [
//       Icon(Icons.ac_unit),
//       Icon(Icons.ac_unit),
//       Icon(Icons.ac_unit),
//       Icon(Icons.ac_unit),
//       Icon(Icons.ac_unit),
//       Icon(Icons.ac_unit),
//       Icon(Icons.ac_unit)
//     ],
//     style: ToggleStyle(
//       borderColor: EternalColors.boxDefaultColor,
//       backgroundColor: EternalColors.boxDefaultColor,
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//     ), // optional style settings
//   ),
