import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_04/pages/home/details/home_details.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';
import 'package:flutter_04/pages/home/search/home_search.dart';
import 'package:flutter_04/pages/home_bottom_navigation_bar.dart';
import 'package:flutter_04/pages/login/login_page.dart';
import 'package:flutter_04/pages/message/chat/message_chat.dart';
import 'package:flutter_04/pages/person/index/side/person_side_attention.dart';
import 'package:flutter_04/pages/person/index/side/person_side_fans.dart';
import 'package:flutter_04/pages/person/index/side/person_side_score.dart';
import 'package:flutter_04/pages/release/details/release_details.dart';
import 'package:flutter_04/pages/release/publish/release_publish.dart';
import 'package:flutter_04/test.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:motion/motion.dart';

import 'constants/eternal_colors.dart';

EventBus bus = EventBus();

///手机宽度
double equipmentWidth = 0;

///手机高度
double equipmentHeight = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the plugin to determine gyroscope availability.
  await Motion.instance.initialize();

  /// Globally set Motion's update interval to 60 frames per second.
  Motion.instance.setUpdateInterval(60.fps);

  runApp(MyApp());
  //设置Android头部的导航栏透明
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    //导航栏背景色
    statusBarColor: Colors.transparent,
    //导航栏 文字颜色
    statusBarIconBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  //初次加载时，会获取不到设备的宽高
  Future.delayed(const Duration(milliseconds: 200), () {
    // equipmentWidth = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    // equipmentHeight = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
    equipmentWidth = MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
    equipmentHeight = MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // //设置高刷
    FlutterDisplayMode.setHighRefreshRate();
    return GestureDetector(
      onTap: () {
        ///全局添加点击空白处监听，关闭键盘并失去焦点
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ETERNAL",
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: const ColorScheme.dark().copyWith(
            primary: Colors.white,
            secondary: EternalColors.boxDefaultColor,
          ),
          // fontFamily: 'HYZhengYuan',
          navigationBarTheme: _naviBarThemeData(),
        ),
        // home: HomeBottomNavigationBar(),
        initialRoute: "/messageChat",
        routes: {
          '/': (context) => const HomeBottomNavigationBar(),
          "/homeDetails": (context) => const HomeDetails(),
          "/homeDetailsTwo": (context) => const HomeDetailsTwo(),
          "/homeSearch": (context) => const HomeSearch(),
          "/personSideScore": (context) => const PersonSideScore(),
          "/personSideFans": (context) => const PersonSideFans(),
          "/personSideAttention": (context) => const PersonSideAttention(),
          "/releasePublish": (context) => const ReleasePublish(),
          "/releaseDetails": (context) => const ReleaseDetails(),
          "/loginPage": (context) => const LoginPage(),
          "/messageChat": (context) => const MessageChat(),
          "/test": (context) => ImperativeModalSheetExample(),
          "/modeTest": (context) => ModeSheetTest(),
        },
      ),
    );
  }

  NavigationBarThemeData _naviBarThemeData() {
    late MaterialStateProperty<IconThemeData?> iconThemeData;
    late MaterialStateProperty<TextStyle?> labelTextStyle;

    iconThemeData = MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.isEmpty) {
        //没有选中的状态下state为空
        return const IconThemeData(size: 24, color: EternalColors.unSelectColor);
      } else if (states.contains(MaterialState.selected)) {
        return const IconThemeData(size: 24, color: EternalColors.selectColor);
      }
      return null;
    });

    labelTextStyle = MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.isEmpty) {
        //没有选中的状态下state为空
        return const TextStyle(color: EternalColors.unSelectColor, fontSize: 12);
      } else if (states.contains(MaterialState.selected)) {
        return const TextStyle(color: EternalColors.selectColor, fontSize: 12);
      }
      return null;
    });

    return NavigationBarThemeData(iconTheme: iconThemeData, labelTextStyle: labelTextStyle);
  }
}
