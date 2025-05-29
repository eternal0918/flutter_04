import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

class HomeCategorySimpleDetails extends StatelessWidget {
  HomeCategorySimpleDetails({super.key});

  TextStyle textStyle = const TextStyle(color: EternalColors.textColor, fontSize: 13);
  String textContent =
      "一个适合做场景设定集，场景插画，儿童探险绘本的lora，画风整体比较治愈，场景大部分采用远景/广角，所以在人物方面上的细节不会很好，比较偏向于场景类的一个lora，不过测试后发现权重0.4-0.6的情况下，搭配其他人物lora，会保持画风的情况下提升人物细节。";

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: EternalColors.defaultColor,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: EternalMargin.miniMargin,
        children: [
          Icon(Icons.data_saver_off_rounded, size: EternalIconSize.defaultSize),
          const Text("参数", style: TextStyle(color: EternalColors.titleColor))
        ],
      ),
      contentPadding: EdgeInsets.symmetric(vertical: EternalPadding.smallPadding),
      children: [
        Container(
          width: 500,
          padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
          child: Column(
            children: [
              ExpansionTile(
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
                  title: Text("分辨率", style: textStyle),
                  trailing: Chip(label: Text("宽:500 - 高:700"), backgroundColor: Colors.indigo)),
              ListTile(
                  title: Text("模型", style: textStyle),
                  trailing: Chip(label: Text("revAnimated_v122EOL_中国风"), backgroundColor: Colors.deepPurple)),
              ListTile(
                  title: Text("采样器", style: textStyle),
                  trailing: Chip(label: Text("DPM++ 2M Karras"), backgroundColor: Colors.deepPurpleAccent)),
              ListTile(
                  title: Text("迭代步数", style: textStyle),
                  trailing: Chip(label: Text("20"), backgroundColor: Colors.blueGrey)),
              ListTile(
                  title: Text("提示词引导系数", style: textStyle),
                  trailing: Chip(label: Text("2"), backgroundColor: Colors.cyan)),
              ListTile(title: Text("随机数种子", style: textStyle), trailing: Chip(label: Text("4151295931"))),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    icon: const Icon(Icons.copy_rounded),
                    label: const Text("复制参数")),
              )
            ],
          ),
        ),
      ],
    );
  }
}
