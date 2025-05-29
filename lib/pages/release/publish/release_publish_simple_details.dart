import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/notification/release/release_publish_simple_details_notification.dart';

///作品简述参数
class ReleasePublishSimpleDetails extends StatefulWidget {
  const ReleasePublishSimpleDetails({super.key});

  @override
  State<ReleasePublishSimpleDetails> createState() => _ReleasePublishSimpleDetailsState();
}

class _ReleasePublishSimpleDetailsState extends State<ReleasePublishSimpleDetails> {
  TextStyle textStyle = const TextStyle(color: EternalColors.textColor, fontSize: 13);
  String textContent =
      "一个适合做场景设定集，场景插画，儿童探险绘本的lora，画风整体比较治愈，场景大部分采用远景/广角，所以在人物方面上的细节不会很好，比较偏向于场景类的一个lora，不过测试后发现权重0.4-0.6的情况下，搭配其他人物lora，会保持画风的情况下提升人物细节。";

  final GlobalKey _promptGlobalKey = GlobalKey();
  final GlobalKey _itemGlobalKey = GlobalKey();

  double _height = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHeight();
  }

  void getHeight() {
    Future.delayed(const Duration(milliseconds: 200), () {
      var promptSize = _promptGlobalKey.currentContext?.findRenderObject()?.paintBounds?.size;
      var itemSize = _itemGlobalKey.currentContext?.findRenderObject()?.paintBounds?.size;
      setState(() {
        double promptHeight = promptSize == null ? 0 : promptSize.height;
        double itemHeight = itemSize == null ? 0 : itemSize.height;
        _height = promptHeight + itemHeight * 6;
        // print("高度：$promptHeight========$itemHeight");
        ///发送数据 父组件通过监听获取数据
        ReleasePublishSimpleDetailsNotification(_height).dispatch(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ExpansionTile(
          key: _promptGlobalKey,
          initiallyExpanded: true,
          onExpansionChanged: (value) {
            getHeight();
          },
          title: Text("提示词", style: textStyle),
          collapsedTextColor: EternalColors.selectColor,
          backgroundColor: Colors.black38,
          collapsedBackgroundColor: Colors.black12,
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
          collapsedShape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
          children: [
            Container(
              padding: EdgeInsets.only(
                left: EternalPadding.smallPadding,
                right: EternalPadding.smallPadding,
                bottom: EternalPadding.smallPadding,
              ),
              child: Text(textContent, style: textStyle),
            )
          ],
        ),
        ListTile(
            key: _itemGlobalKey,
            title: Text("分辨率", style: textStyle),
            trailing: Chip(label: Text("宽:500 - 高:700"), backgroundColor: Colors.indigo)),
        ListTile(
            title: Text("模型", style: textStyle),
            trailing: Chip(label: Text("revAnimated_v122EOL_中国风"), backgroundColor: Colors.deepPurple)),
        ListTile(
            title: Text("采样器", style: textStyle),
            trailing: Chip(label: Text("DPM++ 2M Karras"), backgroundColor: Colors.deepPurpleAccent)),
        ListTile(
            title: Text("迭代步数", style: textStyle), trailing: Chip(label: Text("20"), backgroundColor: Colors.blueGrey)),
        ListTile(
            title: Text("提示词引导系数", style: textStyle), trailing: Chip(label: Text("2"), backgroundColor: Colors.cyan)),
        ListTile(title: Text("随机数种子", style: textStyle), trailing: Chip(label: Text("4151295931"))),
      ],
    );
  }
}