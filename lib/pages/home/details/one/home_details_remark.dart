import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_04/components/eternal_key_board_height.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

///详情 底部评论按钮组件
class HomeDetailsRemark extends StatefulWidget {
  const HomeDetailsRemark({super.key});

  @override
  State<HomeDetailsRemark> createState() => _HomeDetailsRemarkState();
}

class _HomeDetailsRemarkState extends State<HomeDetailsRemark> with WidgetsBindingObserver, EternalKeyboardHeight, SingleTickerProviderStateMixin {
  late final AnimationController _btnAnimationController;

  double _bottom = 0;
  bool _bottomFlag = true;

  @override
  void initState() {
    super.initState();
    _btnAnimationController = AnimationController(
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1.0,
      value: 1.0,
      duration: const Duration(milliseconds: 800),
    );
  }

  void _onTapDown(_) => _btnAnimationController.animateTo(0.9, curve: Curves.elasticOut);

  void _onTapUp(_) => _btnAnimationController.animateTo(1.0, curve: Curves.elasticOut);

  void _onTap() async {
    await _btnAnimationController.animateTo(0.9, curve: Curves.easeInOut, duration: const Duration(milliseconds: 200));
    await _btnAnimationController.animateTo(1.0, curve: Curves.easeInOut, duration: const Duration(milliseconds: 200));
  }

  @override
  void keyboardHeight(double height) {
    super.keyboardHeight(height);
    _bottom = height;
    _bottom > 100 ? _bottomFlag = true : _bottomFlag = false;
  }

  @override
  void dispose() {
    super.dispose();
    _btnAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => _btnAnimationController.animateTo(1.0, curve: Curves.elasticOut),
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _btnAnimationController,
        builder: (_, child) => Transform.scale(
          scale: _btnAnimationController.value,
          child: child,
        ),
        child: Container(
          padding: EdgeInsets.all(EternalPadding.smallPadding),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(width: 1, color: Colors.white24)),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width - EternalPadding.smallPadding * 2,
                  padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding, vertical: EternalPadding.miniPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black26,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          // side: BorderSide(color: Colors.white12, width: 1),
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: EternalPadding.mainLargePadding, vertical: EternalPadding.smallPadding),
                          shape: const StadiumBorder(),
                        ),
                        icon: Icon(
                          Icons.drive_file_rename_outline_rounded,
                          color: Colors.white,
                          size: EternalIconSize.defaultSize,
                        ),
                        label: Text("发表您的观点...", style: TextStyle(color: Colors.white, letterSpacing: 2, fontSize: EternalFontSize.regular())),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: EternalColors.defaultColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.only(bottom: _bottomFlag ? _bottom : 0),
                                width: double.infinity,
                                child: TextField(),
                              );
                            },
                          );
                        },
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_rounded, size: EternalIconSize.smallSize),
                            label: Text("5342"),
                            style: TextButton.styleFrom(elevation: 0, shape: const StadiumBorder()),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.chat_rounded, size: EternalIconSize.smallSize),
                            label: Text("5342"),
                            style: TextButton.styleFrom(elevation: 0, shape: const StadiumBorder()),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
