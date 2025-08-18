//header右部组件
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../components/eternal_alert_dialog.dart';

class HomeDetailsHeaderRight extends StatefulWidget {
  const HomeDetailsHeaderRight({super.key});

  @override
  State<HomeDetailsHeaderRight> createState() => _HomeDetailsHeaderRightState();
}

class _HomeDetailsHeaderRightState extends State<HomeDetailsHeaderRight> {
  String title = "求关注";
  bool titleFlag = false;
  IconData icon = LucideIcons.circleFadingPlus;
  Color bgColor = Colors.transparent;
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedSwitcher(
          switchInCurve: Curves.easeInOutBack,
          transitionBuilder: (child, anim) {
            return ScaleTransition(scale: anim, child: child);
          },
          duration: const Duration(milliseconds: 300),
          child: ElevatedButton.icon(
            key: ValueKey(titleFlag),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              backgroundColor: bgColor,
              foregroundColor: Colors.white,
              shadowColor: Colors.white,

              side: BorderSide(width: 1, color: bgColor == Colors.transparent ? Colors.white : bgColor),
            ),
            icon: Icon(icon, color: textColor, size: EternalIconSize.defaultSize),
            label: Text(title, style: TextStyle(color: textColor, fontSize: EternalFontSize.regular())),
            onPressed: () {
              setState(() {
                if (titleFlag) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EternalAlertDialog(
                          titleIcon: const Icon(Icons.error_rounded),
                          title: "提示",
                          content: Center(heightFactor: 1, child: Text("确定取消关注吗？", style: TextStyle(fontSize: EternalFontSize.medium()))),
                          cancelContent: Text(
                            "取消",
                            style: TextStyle(color: EternalColors.textColor, fontSize: EternalFontSize.medium(), letterSpacing: 2),
                          ),
                          confirmContent: Text(
                            "确认",
                            style: TextStyle(color: Colors.blueAccent, fontSize: EternalFontSize.medium(), letterSpacing: 2),
                          ),
                          confirm: () {
                            Navigator.of(context).pop();
                            setState(() {
                              titleFlag = false;
                              title = "求关注";
                              icon = LucideIcons.circleFadingPlus;
                              bgColor = Colors.transparent;
                              textColor = Colors.white;
                            });
                          },
                          cancel: () {
                            Navigator.of(context).pop();
                          },
                        );
                      });
                } else {
                  titleFlag = true;
                  title = "已关注";
                  icon = Icons.done_all;
                  bgColor = EternalColors.getPrimaryColor();
                  textColor = Colors.white;
                }
              });
            },
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_rounded, size: EternalIconSize.defaultSize),
          splashRadius: 20,
        )
      ],
    );
  }
}
