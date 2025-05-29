import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/components/eternal_alert_dialog.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/release/details/release_publish_resolution.dart';
import 'package:flutter_04/pages/release/publish/release_publish.dart';
import 'package:motion/motion.dart';

class ReleaseDetails extends StatefulWidget {
  const ReleaseDetails({Key? key}) : super(key: key);

  @override
  _ReleaseDetailsState createState() => _ReleaseDetailsState();
}

class _ReleaseDetailsState extends State<ReleaseDetails> with TickerProviderStateMixin {
  final TextStyle _titleStyle = const TextStyle(
    color: EternalColors.titleColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  final TextStyle _textStyle = const TextStyle(
    color: EternalColors.textColor,
    fontSize: 15,
    letterSpacing: 0.5,
  );

  final String _textContent =
      "一个适合做场景设定集，场景插画，儿童探险绘本的lora，画风整体比较治愈，场景大部分采用远景/广角，所以在人物方面上的细节不会很好，比较偏向于场景类的一个lora，不过测试后发现权重0.4-0.6的情况下，搭配其他人物lora，会保持画风的情况下提升人物细节。";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EternalColors.defaultColor,
        elevation: 0,
        title: Text("作品"),
      ),
      backgroundColor: EternalColors.defaultColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: EternalMargin.normalMargin),
                  Container(
                    height: 500,
                    padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding),
                    child: Motion.elevated(
                      elevation: 70,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          image: DecorationImage(
                            image: NetworkImage(EternalConstants.randomImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: EternalMargin.largeMargin),
                ],
              ),
            ),
          ),

          ///作品描述
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: EternalMargin.smallMargin),
                  Wrap(
                    spacing: EternalMargin.smallMargin,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.all_inclusive_rounded, color: Colors.blue, size: EternalIconSize.defaultSize),
                      Text("作品描述", style: _titleStyle),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(EternalPadding.normalPadding),
                    child: Text(_textContent, style: _textStyle),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: EternalMargin.smallMargin)),

          ///详细参数
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: EternalMargin.smallMargin,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.gesture, color: Colors.orange.shade900, size: EternalIconSize.defaultSize),
                      Text("详细参数", style: _titleStyle),
                    ],
                  ),
                  SizedBox(height: EternalMargin.normalMargin),
                  Column(
                    children: [
                      ListTile(title: Text("分辨率", style: _textStyle), trailing: Chip(label: Text("宽:500 - 高:700"), backgroundColor: Colors.indigo)),
                      ListTile(
                          title: Text("模型", style: _textStyle),
                          trailing: Chip(label: Text("revAnimated_v122EOL_中国风"), backgroundColor: Colors.deepPurple)),
                      ListTile(
                          title: Text("采样器", style: _textStyle),
                          trailing: Chip(label: Text("DPM++ 2M Karras"), backgroundColor: Colors.deepPurpleAccent)),
                      ListTile(title: Text("迭代步数", style: _textStyle), trailing: Chip(label: Text("20"), backgroundColor: Colors.blueGrey)),
                      ListTile(title: Text("提示词引导系数", style: _textStyle), trailing: Chip(label: Text("2"), backgroundColor: Colors.cyan)),
                      ListTile(title: Text("随机数种子", style: _textStyle), trailing: Chip(label: Text("4151295931"))),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding),
                    margin: EdgeInsets.symmetric(vertical: EternalMargin.normalMargin),
                    height: 1,
                    child: const Divider(),
                  ),
                  Column(
                    children: [
                      ListTile(title: Text("创作者", style: _textStyle), trailing: Chip(label: Text("Eternal"))),
                      ListTile(
                        title: Text("创建时间", style: _textStyle),
                        trailing: Chip(
                          label: Text(EternalConstants.getCurrentTime()),
                          backgroundColor: Colors.deepPurple,
                        ),
                      ),
                      ListTile(
                        title: Text("耗时时间", style: _textStyle),
                        trailing: Chip(label: Text("${(Random().nextDouble() * 10).toStringAsFixed(2)}秒"), backgroundColor: Colors.deepPurpleAccent),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: EternalMargin.normalMargin))
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: EternalMargin.normalMargin,
          right: EternalMargin.normalMargin,
          bottom: EternalMargin.normalMargin,
        ),
        decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(
          horizontal: EternalPadding.defaultPadding,
          vertical: EternalPadding.normalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                EternalNavigatorRoute.push(context, const ReleasePublish());
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.send_time_extension_outlined, color: EternalColors.getSuccessColor()),
                  Text("去发布", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return EternalAlertDialog(
                        titleIcon: Icon(
                          Icons.error_rounded,
                          color: EternalColors.getDangerColor(),
                        ),
                        title: "警告",
                        content: Wrap(
                          direction: Axis.vertical,
                          spacing: EternalMargin.smallMargin,
                          children: [
                            const Text("确定删除当前作品吗？"),
                            Text(
                              "删除后，作品将在云端被移除，请熟知。",
                              style: TextStyle(color: EternalColors.getDangerColor(), fontSize: 13),
                            ),
                          ],
                        ),
                        cancelContent: const Text("取消"),
                        confirmContent: const Text("确认"),
                        confirm: () {
                          Navigator.of(context).pop();
                        },
                        cancel: () {
                          Navigator.of(context).pop();
                        },
                      );
                    });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete_forever_rounded, color: EternalColors.getDangerColor()),
                  Text("删除作品", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.switch_access_shortcut_add_rounded, color: Colors.deepPurpleAccent),
                  Text("再画一张", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                EternalNavigatorRoute.push(context, ReleasePublishResolution());
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.two_k_outlined,
                    color: EternalColors.getPrimaryColor(),
                  ),
                  Text("超分辨率", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download, color: Colors.blue),
                  Text("下载保存", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
