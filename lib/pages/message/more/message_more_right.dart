import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../constants/eternal_colors.dart';
import '../../../constants/eternal_constants.dart';
import '../../../constants/eternal_font_size.dart';
import '../../../constants/eternal_icon_size.dart';
import '../../../constants/eternal_margin.dart';
import '../../../constants/eternal_padding.dart';

class MessageMoreRight extends StatefulWidget {
  const MessageMoreRight({super.key});

  @override
  State<MessageMoreRight> createState() => _MessageMoreRightState();
}

class _MessageMoreRightState extends State<MessageMoreRight> {
  bool _userMsgCloseNotifyFlag = false;
  bool _userTopFlag = false;
  final double _borderSize = 0.2;
  final TextStyle _textStyle = TextStyle(
    fontSize: EternalFontSize.regular(),
  );

  final List<Positioned> _userAvatarList = [];

  @override
  void initState() {
    _userAvatarList.add(const Positioned(child: Text("")));
    for (int i = 0; i < 3; i++) {
      _userAvatarList.add(Positioned(
        left: (15 * i).toDouble(),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipOval(child: Image.network(EternalConstants.getImage(), fit: BoxFit.cover)),
        ),
      ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      resizeToAvoidBottomInset: false, //输入法不会顶起页面
      appBar: AppBar(
        elevation: 0,
        backgroundColor: EternalColors.defaultColor,
        title: const Text("聊天设置"),
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
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding, vertical: EternalPadding.smallPadding),
                              leading: CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/512/512'), radius: 30),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("软件 邹浩鹏", style: _textStyle),
                                  SizedBox(height: EternalMargin.miniMargin),
                                  Text("Sisyphus", style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.selectColor)),
                                  SizedBox(height: EternalMargin.miniMargin),
                                ],
                              ),
                              subtitle: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(50), child: Container(width: 10, height: 10, color: Colors.green)),
                                  SizedBox(width: EternalMargin.miniMargin),
                                  Text('在线', style: TextStyle(fontSize: EternalFontSize.base())),
                                ],
                              ),
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
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding, vertical: EternalPadding.smallPadding),
                              leading: SizedBox(height: 30, width: 60, child: Stack(children: _userAvatarList)),
                              title: Text("发起群聊", style: _textStyle),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.chevron_right, color: EternalColors.selectColor, size: EternalIconSize.defaultSize),
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
                              setState(() => _userTopFlag = !_userTopFlag);
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("设为置顶", style: _textStyle),
                              trailing: Switch(
                                activeColor: EternalColors.getWarningColor(),
                                inactiveThumbColor: EternalColors.getInfoColor(),
                                dragStartBehavior: DragStartBehavior.start,
                                value: _userTopFlag,
                                onChanged: (bool v) {
                                  setState(() => _userTopFlag = !_userTopFlag);
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
                              setState(() => _userMsgCloseNotifyFlag = !_userMsgCloseNotifyFlag);
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("消息免打扰", style: _textStyle),
                              trailing: Switch(
                                activeColor: EternalColors.getSuccessColor(),
                                inactiveThumbColor: EternalColors.getInfoColor(),
                                dragStartBehavior: DragStartBehavior.start,
                                value: _userMsgCloseNotifyFlag,
                                onChanged: (bool v) {
                                  setState(() => _userMsgCloseNotifyFlag = !_userMsgCloseNotifyFlag);
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
                              setState(() {});
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                              title: Text("查看聊天记录", style: _textStyle),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("图片、视频、文件", style: TextStyle(color: EternalColors.selectColor, fontSize: EternalFontSize.base())),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(LucideIcons.calendarCheck, color: EternalColors.getPrimaryColor(), size: EternalIconSize.defaultSize),
                                    splashRadius: 20,
                                  )
                                ],
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
                              title: Text("设置聊天背景", style: _textStyle),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(LucideIcons.sparkles, color: Colors.deepPurpleAccent, size: EternalIconSize.defaultSize),
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
            Wrap(
              direction: Axis.horizontal,
              spacing: EternalMargin.normalMargin,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    backgroundColor: EternalColors.getDangerColor(),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  icon: Icon(LucideIcons.userX, size: EternalIconSize.smallSize, color: Colors.white),
                  label: Text(
                    "删除用户",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: EternalFontSize.regular(),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    backgroundColor: Colors.blueAccent,
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  icon: Icon(LucideIcons.bookX, size: EternalIconSize.smallSize, color: Colors.white),
                  label: Text(
                    "清除聊天记录",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: EternalFontSize.regular(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
