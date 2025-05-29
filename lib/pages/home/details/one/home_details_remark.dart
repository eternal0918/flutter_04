import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/components/eternal_key_board_height.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

///详情 底部评论按钮组件
class HomeDetailsRemark extends StatefulWidget {
  const HomeDetailsRemark({super.key});

  @override
  State<HomeDetailsRemark> createState() => _HomeDetailsRemarkState();
}

class _HomeDetailsRemarkState extends State<HomeDetailsRemark> with WidgetsBindingObserver, EternalKeyboardHeight {
  double bottom = 0;
  bool bottomFlag = true;

  @override
  void keyboardHeight(double height) {
    super.keyboardHeight(height);
    bottom = height;
    bottom > 100 ? bottomFlag = true : bottomFlag = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(EternalPadding.smallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 40),
              backgroundColor: EternalColors.boxDefaultColor,
              elevation: 0,
              shape: StadiumBorder(),
            ),
            icon: Icon(Icons.drive_file_rename_outline_rounded, color: Colors.white),
            label: Text("发表您的观点...", style: TextStyle(color: Colors.white, letterSpacing: 2)),
            onPressed: () {
              // print("键盘高度1：${bottom}");
              showModalBottomSheet(
                backgroundColor: EternalColors.defaultColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.only(bottom: bottomFlag ? bottom : 0),
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
                icon: Icon(Icons.favorite_rounded),
                label: Text("5342"),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat_rounded),
                label: Text("5342"),
              )
            ],
          )
        ],
      ),
    );
  }
}