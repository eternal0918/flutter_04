//header右部组件
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';

import '../../../../components/eternal_alert_dialog.dart';

class HomeDetailsHeaderRight extends StatefulWidget {
  const HomeDetailsHeaderRight({super.key});

  @override
  State<HomeDetailsHeaderRight> createState() => _HomeDetailsHeaderRightState();
}

class _HomeDetailsHeaderRightState extends State<HomeDetailsHeaderRight> {
  String title = "求关注";
  bool titleFlag = false;
  IconData icon = Icons.add_rounded;
  Color bgColor = Colors.white;
  Color textColor = Colors.black;

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
          duration: Duration(milliseconds: 300),
          child: ElevatedButton.icon(
            key: ValueKey(titleFlag),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: StadiumBorder(),
              backgroundColor: bgColor,
            ),
            icon: Icon(icon, color: textColor),
            label: Text(title, style: TextStyle(color: textColor)),
            onPressed: () {
              setState(() {
                if (titleFlag) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EternalAlertDialog(
                          titleIcon: Icon(Icons.error_rounded),
                          title: "提示",
                          content: Center(heightFactor: 1, child: Text("确定取消关注吗？")),
                          cancelContent: Text("取消"),
                          confirmContent: Text("确认"),
                          confirm: () {
                            Navigator.of(context).pop();
                            setState(() {
                              titleFlag = false;
                              title = "求关注";
                              icon = Icons.add_rounded;
                              bgColor = Colors.white;
                              textColor = Colors.black;
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
                  bgColor =  EternalColors.getPrimaryColor();
                  textColor = Colors.white;
                }
              });
            },
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_rounded),
          splashRadius: 20,
        )
      ],
    );
  }
}