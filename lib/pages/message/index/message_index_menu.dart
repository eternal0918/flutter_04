import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../base/eternal_navigator_route.dart';
import '../../../components/eternal_mode_sheet.dart';
import '../../../constants/eternal_colors.dart';
import '../../../constants/eternal_font_size.dart';
import '../../../constants/eternal_margin.dart';

class MessageIndexMenu extends StatelessWidget {
  const MessageIndexMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return EternalModeSheet(
      content: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("添加用户", style: TextStyle(fontSize: EternalFontSize.medium())),
                    SizedBox(height: EternalMargin.miniMargin),
                    Text(
                      "通过账号、手机号、邮箱、昵称等搜索",
                      style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.secondTextColor),
                    ),
                  ],
                ),
                const Icon(LucideIcons.circleFadingPlus),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("添加群组", style: TextStyle(fontSize: EternalFontSize.medium())),
                    SizedBox(height: EternalMargin.miniMargin),
                    Text(
                      "通过群号、群昵称等搜索",
                      style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.secondTextColor),
                    ),
                  ],
                ),
                const Icon(LucideIcons.drama),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              //跳转到登录界面
            },
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("移除所有会话", style: TextStyle(fontSize: EternalFontSize.medium())),
                      SizedBox(height: EternalMargin.miniMargin),
                      Text(
                        "仅删除会话，聊天记录仍保留",
                        style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.secondTextColor),
                      ),
                    ],
                  ),

                  const Icon(LucideIcons.messageCircleX),
                ],
              ),
            ),
          ),
          SizedBox(height: EternalMargin.smallMargin),
        ],
      ),
    );
    ;
  }
}
