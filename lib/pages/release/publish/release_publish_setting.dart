import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

class ReleasePublishSetting extends StatefulWidget {
  const ReleasePublishSetting({super.key});

  @override
  State<ReleasePublishSetting> createState() => _ReleasePublishSettingState();
}

class _ReleasePublishSettingState extends State<ReleasePublishSetting> {
  String _viewTitle = "公开";
  int _isShowData = 0;
  int _isDownload = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(
        left: EternalMargin.smallMargin,
        right: EternalMargin.smallMargin,
        bottom: EternalMargin.smallMargin,
      ),
      decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: EternalPadding.miniPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          ListTile(
            dense: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: EternalMargin.smallMargin,
                  children: [
                    Icon(Icons.remove_red_eye_outlined, size: EternalIconSize.smallSize),
                    const Text("谁可以看", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(_viewTitle, style: const TextStyle(color: EternalColors.textColor)),
              ],
            ),
            trailing: SizedBox(
              width: 50,
              child: Theme(
                data: Theme.of(context).copyWith(cardColor: EternalColors.boxDefaultColor),
                child: PopupMenuButton(
                  tooltip: "选择",
                  splashRadius: 20,
                  shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  clipBehavior: Clip.hardEdge,
                  icon: Icon(Icons.arrow_drop_down, size: EternalIconSize.defaultSize, color: EternalColors.textColor),
                  onSelected: (index) {
                    setState(() {
                      switch (index) {
                        case 0:
                          _viewTitle = "公开";
                          break;
                        case 1:
                          _viewTitle = "仅关注";
                          break;
                        case 2:
                          _viewTitle = "仅自己";
                          break;
                      }
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(value: 0, child: Text('公开')),
                    const PopupMenuItem(value: 1, child: Text('仅关注')),
                    const PopupMenuItem(value: 2, child: Text('仅自己')),
                  ],
                ),
              ),
            ),
          ),
          ///展示参数
          ListTile(
            dense: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: EternalMargin.smallMargin,
                  children: [
                    Icon(Icons.dataset_linked_rounded, size: EternalIconSize.smallSize),
                    const Text("展示参数", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(
                  _isShowData == 0 ? "关闭" : "开启",
                  style: const TextStyle(color: EternalColors.textColor),
                )
              ],
            ),
            trailing: SizedBox(
              width: 50,
              child: Switch(
                value: _isShowData == 1,
                activeColor: EternalColors.getSuccessColor(),
                inactiveThumbColor: EternalColors.getInfoColor(),
                onChanged: (bool value) {
                  setState(() {
                    _isShowData = !value ? 0 : 1;
                  });
                },
              ),
            ),
          ),
          ///是否下载
          ListTile(
            dense: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: EternalMargin.smallMargin,
                  children: [
                    Icon(Icons.download, size: EternalIconSize.smallSize),
                    const Text("下载保存", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(
                  _isDownload == 0 ? "关闭" : "开启",
                  style: const TextStyle(color: EternalColors.textColor),
                )
              ],
            ),
            trailing: SizedBox(
              width: 50,
              child: Switch(
                value: _isDownload == 1,
                activeColor: EternalColors.getSuccessColor(),
                inactiveThumbColor: EternalColors.getInfoColor(),
                onChanged: (bool value) {
                  setState(() {
                    _isDownload = !value ? 0 : 1;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}