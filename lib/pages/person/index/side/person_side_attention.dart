import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/components/eternal_sheet_slip.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';

class PersonSideAttention extends StatefulWidget {
  const PersonSideAttention({Key? key}) : super(key: key);

  @override
  _PersonSideAttentionState createState() => _PersonSideAttentionState();
}

class _PersonSideAttentionState extends State<PersonSideAttention> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      appBar: AppBar(
        backgroundColor: EternalColors.defaultColor,
        elevation: 0,
        title: const Text("我的关注"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 20,
        ),
        actions: [
          Theme(
              data: Theme.of(context).copyWith(cardColor: EternalColors.boxDefaultColor),
              child: PopupMenuButton(
                  tooltip: "更多",
                  splashRadius: 20,
                  shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  clipBehavior: Clip.hardEdge,
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        const PopupMenuItem(value: 0, child: Text('修改信息')),
                        const PopupMenuItem(value: 1, child: Text('删除')),
                      ],
                  onSelected: (index) {}))
        ],
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ///搜索栏
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: EternalMargin.defaultMargin),
              decoration: BoxDecoration(
                color: EternalColors.boxDefaultColor,
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
              height: 40,
              child: TextField(
                style: const TextStyle(color: EternalColors.textColor),
                scrollPadding: EdgeInsets.zero,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: EternalPadding.defaultPadding),
                  hintText: '搜索用户备注或名字',
                  suffixIcon: TextButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: const Text("搜索"),
                  ),
                  prefixIcon: InkWell(
                    onTap: () {
                      ///搜索后 关闭键盘并失去焦点
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: const Icon(Icons.person_search),
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: EternalColors.boxDefaultColor,
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: EternalMargin.smallMargin)),

          ///粉丝 title
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
              child: Row(
                children: [
                  Text("我的关注（${Random().nextInt(100)}人）"),
                  TextButton(onPressed: () {}, child: Text("我的分组（${Random().nextInt(20)}个）")),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(child: SizedBox(height: EternalMargin.smallMargin)),

          ///关注列表
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    EternalNavigatorRoute.push(context, HomeDetailsTwo());
                  },
                  // NetworkImage(EternalConstants.getImage())
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: EternalConstants.getImage(),
                      height: 65,
                      width: 60,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  title: Text(
                    "Eternal$index （ 朱晓鹏 ）",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: const Text("吹不出褶的平静日子也在闪光。", style: TextStyle(fontSize: 12)),
                  trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: EternalColors.boxDefaultColor, elevation: 0),
                          child: Text(
                            Random().nextInt(100) % 2 == 0 ? '互相关注' : '已关注',
                            style: const TextStyle(fontSize: 13, color: EternalColors.titleColor),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz_rounded),
                        splashRadius: 20,
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: EternalColors.defaultColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                            context: context,
                            builder: (context) => StatefulBuilder(
                              builder: (context, setState) {
                                return const SideAttentionSheet();
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
              childCount: 50,
            ),
          )
        ],
      ),
    );
  }
}

class SideAttentionSheet extends StatefulWidget {
  const SideAttentionSheet({super.key});

  @override
  State<SideAttentionSheet> createState() => _SideAttentionSheetState();
}

class _SideAttentionSheetState extends State<SideAttentionSheet> {
  bool _switchFlag = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: EternalPadding.defaultPadding,
        right: EternalPadding.defaultPadding,
        bottom: EternalPadding.defaultPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const EternalSheetSlip(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(EternalConstants.randomImageUrl),
              radius: 30,
            ),
            title: const Text("Eternal", style: TextStyle(fontSize: 18)),
            subtitle: Text("ID:${Random().nextInt(9999999)}", style: const TextStyle(fontSize: 13)),
            trailing: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.drive_file_rename_outline, size: EternalIconSize.smallSize),
              label: const Text("设置备注"),
            ),
          ),
          SizedBox(height: EternalMargin.smallMargin),
          Container(
            decoration: BoxDecoration(
              color: EternalColors.boxDefaultColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.2, color: EternalColors.unSelectColor),
            ),
            padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("特别关注"),
                  subtitle: const Text("作品优先推荐，更新及时提醒"),
                  trailing: Switch(
                    activeColor: EternalColors.getSuccessColor(),
                    inactiveThumbColor: EternalColors.getInfoColor(),
                    value: _switchFlag,
                    onChanged: (bool v) {
                      setState(() {
                        _switchFlag = v;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 0.2, child: Divider(color: EternalColors.unSelectColor)),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("设置分组"),
                  trailing: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.groups_3),
                      splashRadius: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: EternalMargin.defaultMargin),
          Container(
            decoration: BoxDecoration(
              color: EternalColors.boxDefaultColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.2, color: EternalColors.unSelectColor),
            ),
            padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "取消关注",
                style: TextStyle(color: EternalColors.getDangerColor()),
              ),
              trailing: Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_circle, color: EternalColors.getDangerColor()),
                  splashRadius: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
