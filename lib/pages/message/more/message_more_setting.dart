import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';

import '../../../constants/eternal_colors.dart';
import '../../../constants/eternal_padding.dart';

class MessageMoreSetting extends StatefulWidget {
  const MessageMoreSetting({super.key});

  @override
  State<MessageMoreSetting> createState() => _MessageMoreSettingState();
}

class _MessageMoreSettingState extends State<MessageMoreSetting> {
  bool _userMsgCloseNotify = false;
  bool _userStart = false;
  bool _userBlacklist = false;
  final double _borderSize = 0.2;
  final TextStyle _textStyle = TextStyle(
    fontSize: EternalFontSize.regular(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      resizeToAvoidBottomInset: false, //输入法不会顶起页面
      appBar: AppBar(
        elevation: 0,
        backgroundColor: EternalColors.defaultColor,
        title: const Text("设置"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 20,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: EternalPadding.normalPadding, horizontal: EternalPadding.defaultPadding),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: ShapeDecoration(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: EternalColors.unSelectColor, width: _borderSize),
                      ),
                      color: EternalColors.boxDefaultColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("备注", style: _textStyle),
                              trailing: Material(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "sisyphus",
                                      style: TextStyle(
                                        fontSize: EternalFontSize.regular(),
                                        color: EternalColors.selectColor,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.chevron_right,
                                        color: EternalColors.selectColor,
                                        size: EternalIconSize.defaultSize,
                                      ),
                                      splashRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: _borderSize,
                            padding: EdgeInsets.symmetric(horizontal: EternalPadding.mainLargePadding),
                            child: const Divider(color: EternalColors.unSelectColor)),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("分组", style: _textStyle),
                              trailing: TextButton(
                                onPressed: () {},
                                child: Text("AI图文", style: TextStyle(fontSize: EternalFontSize.regular(), color: Colors.blueAccent)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: _borderSize,
                            padding: EdgeInsets.symmetric(horizontal: EternalPadding.mainLargePadding),
                            child: const Divider(color: EternalColors.unSelectColor)),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("粉丝权限", style: _textStyle),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: EternalColors.selectColor,
                                  size: EternalIconSize.defaultSize,
                                ),
                                splashRadius: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: EternalMargin.defaultMargin),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: ShapeDecoration(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: EternalColors.unSelectColor, width: _borderSize),
                      ),
                      color: EternalColors.boxDefaultColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() => _userStart = !_userStart);
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("设为星标", style: _textStyle),
                              trailing: Switch(
                                activeColor: EternalColors.getWarningColor(),
                                inactiveThumbColor: EternalColors.getInfoColor(),
                                dragStartBehavior: DragStartBehavior.start,
                                value: _userStart,
                                onChanged: (bool v) {
                                  setState(() => _userStart = !_userStart);
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: _borderSize,
                            padding: EdgeInsets.symmetric(horizontal: EternalPadding.mainLargePadding),
                            child: const Divider(color: EternalColors.unSelectColor)),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("移除粉丝", style: _textStyle),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.person_remove, size: EternalIconSize.defaultSize),
                                splashRadius: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: _borderSize,
                          padding: EdgeInsets.symmetric(horizontal: EternalPadding.mainLargePadding),
                          child: const Divider(color: EternalColors.unSelectColor),
                        ),
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                                title: Text("取消关注", style: _textStyle),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove_circle, size: EternalIconSize.defaultSize),
                                  splashRadius: 20,
                                ),
                              ),
                            )),
                        Container(
                            height: _borderSize,
                            padding: EdgeInsets.symmetric(horizontal: EternalPadding.mainLargePadding),
                            child: const Divider(color: EternalColors.unSelectColor)),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() => _userMsgCloseNotify = !_userMsgCloseNotify);
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("消息免打扰", style: _textStyle),
                              trailing: Switch(
                                activeColor: EternalColors.getSuccessColor(),
                                inactiveThumbColor: EternalColors.getInfoColor(),
                                dragStartBehavior: DragStartBehavior.start,
                                value: _userMsgCloseNotify,
                                onChanged: (bool v) {
                                  setState(() => _userMsgCloseNotify = !_userMsgCloseNotify);
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: EternalMargin.defaultMargin),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: ShapeDecoration(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: EternalColors.unSelectColor, width: _borderSize),
                      ),
                      color: EternalColors.boxDefaultColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() => _userBlacklist = !_userBlacklist);
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("设置为黑名单", style: _textStyle),
                              trailing: Switch(
                                activeColor: EternalColors.getSuccessColor(),
                                inactiveThumbColor: EternalColors.getInfoColor(),
                                dragStartBehavior: DragStartBehavior.start,
                                value: _userBlacklist,
                                onChanged: (bool v) {
                                  setState(() => _userBlacklist = !_userBlacklist);
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: _borderSize,
                            padding: EdgeInsets.symmetric(horizontal: EternalPadding.mainLargePadding),
                            child: const Divider(color: EternalColors.unSelectColor)),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("举报", style: _textStyle),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: EternalColors.selectColor,
                                  size: EternalIconSize.defaultSize,
                                ),
                                splashRadius: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                side: const BorderSide(color: Colors.transparent),
              ),
              child: Text(
                "删除",
                style: TextStyle(
                  color: Colors.red,
                  letterSpacing: 2,
                  fontSize: EternalFontSize.medium(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
