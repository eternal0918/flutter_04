import 'dart:async';
import 'dart:ui';

import 'package:dough/dough.dart';
import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';

import 'package:flutter_04/pages/home/details/one/home_details_remark.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:lottie/lottie.dart';
import 'package:vibration/vibration.dart';
import '../../../../constants/eternal_constants.dart';
import '../../../../constants/eternal_margin.dart';
import '../../../../constants/eternal_padding.dart';
import 'home_details_body_page.dart';

//图片详情页
class HomeDetailsOne extends StatefulWidget {
  const HomeDetailsOne({super.key});

  @override
  State<HomeDetailsOne> createState() => _HomeDetailsOneState();
}

class _HomeDetailsOneState extends State<HomeDetailsOne> {
  final ValueNotifier<bool> _isFlexibleSpaceBarClosed = ValueNotifier<bool>(false);
  late StreamController<OperateEvent> _eventStreamController;

  _onScrollFlagChanged(bool flag) {
    setState(() {
      _isFlexibleSpaceBarClosed.value = flag;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///将 悬浮窗 初始化并隐藏（因加载原因，这里设置下延迟时间）
    _eventStreamController = StreamController.broadcast();
    Future.delayed(const Duration(milliseconds: 50), () {
      _eventStreamController.add(OperateEvent.OPERATE_HIDE);
    });

    ///监听 屏幕滑动到指定位置时 修改 悬浮窗 展示还是隐藏
    _isFlexibleSpaceBarClosed.addListener(() {
      setState(() {
        if (_isFlexibleSpaceBarClosed.value) {
          _eventStreamController.add(OperateEvent.OPERATE_SHOW);
        } else {
          _eventStreamController.add(OperateEvent.OPERATE_HIDE);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: EternalColors.defaultColor,
      body: Stack(
        children: [
          ///详情主体
          HomeDetailsBodyPage(onScrollFlagChanged: _onScrollFlagChanged),

          ///悬浮 照片墙
          DraggableFloatWidget(
            eventStreamController: _eventStreamController,
            config: const DraggableFloatWidgetBaseConfig(
                isFullScreen: true,
                borderTopContainTopBar: true,
                initPositionYInTop: true,
                initPositionYMarginBorder: 0,
                borderBottom: 100,
                initPositionXInLeft: false,
                appBarHeight: 60),
            onTap: () => print("Drag onTap!"),
            child: CustomPopup(
              animationCurve: Curves.easeOutBack,
              animationDuration: const Duration(milliseconds: 400),
              onBeforePopup: () {
                // 触发轻微震动反馈
                Vibration.vibrate(duration: 10, amplitude: 50);
                FocusScope.of(context).requestFocus(FocusNode());
              },
              //箭头颜色
              arrowColor: Colors.grey.shade700,
              //遮罩颜色
              barrierColor: Colors.transparent,
              //背景颜色
              backgroundColor: Colors.transparent,
              //内边距
              contentPadding: EdgeInsets.zero,
              content: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: Colors.white.withOpacity(0.3),
                    padding: EdgeInsets.only(
                      left: EternalPadding.miniPadding,
                      top: EternalPadding.smallPadding,
                      right: EternalPadding.miniPadding,
                      // bottom: EternalPadding.smallPadding,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              padding: EdgeInsets.symmetric(horizontal: EternalPadding.miniPadding),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(EternalConstants.getImage(), fit: BoxFit.cover),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) => SizedBox(width: EternalMargin.miniMargin),
                              itemCount: 10,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.black26,
                                  foregroundColor: Colors.white,
                                  shadowColor: Colors.transparent,
                                  padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding)),
                              child: const Text("选择下载"),
                            ),
                            SizedBox(width: EternalMargin.smallMargin),
                            TextButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.black26,
                                  foregroundColor: Colors.white,
                                  shadowColor: Colors.transparent,
                                  padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding)),
                              child: const Text("下载全部"),
                            ),
                            SizedBox(width: EternalMargin.miniMargin)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              child: Transform.scale(
                scale: 0.8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(color: Colors.yellowAccent, borderRadius: BorderRadius.circular(10)),
                  child: Lottie.asset('assets/lottie/pic.json', fit: BoxFit.fill),
                ),
              ),
            ),
          ),

          ///悬浮评论框
          const Positioned(bottom: 10, child: HomeDetailsRemark())
        ],
      ),
      // bottomNavigationBar: HomeDetailsRemark(),
    );
  }
}
