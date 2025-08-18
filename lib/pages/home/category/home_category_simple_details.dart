import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

import '../../../components/eternal_mode_sheet.dart';

class HomeCategorySimpleDetails extends StatelessWidget {
  HomeCategorySimpleDetails({super.key});

  final TextStyle _textStyle = TextStyle(color: EternalColors.textColor, fontSize: EternalFontSize.base());
  final TextStyle _secondTextStyle = TextStyle(color: EternalColors.titleColor, fontSize: EternalFontSize.base());
  final String _textContent =
      "一个适合做场景设定集，场景插画，儿童探险绘本的lora，画风整体比较治愈，场景大部分采用远景/广角，所以在人物方面上的细节不会很好，比较偏向于场景类的一个lora，不过测试后发现权重0.4-0.6的情况下，搭配其他人物lora，会保持画风的情况下提升人物细节。一个适合做场景设定集，场景插画，儿童探险绘本的lora，画风整体比较治愈，场景大部分采用远景/广角，所以在人物方面上的细节不会很好，比较偏向于场景类的一个lora，不过测试后发现权重0.4-0.6的情况下，搭配其他人物lora，会保持画风的情况下提升人物细节。一个适合做场景设定集，场景插画，儿童探险绘本的lora，画风整体比较治愈，场景大部分采用远景/广角，所以在人物方面上的细节不会很好，比较偏向于场景类的一个lora，不过测试后发现权重0.4-0.6的情况下，搭配其他人物lora，会保持画风的情况下提升人物细节。";

  @override
  Widget build(BuildContext context) {
    return EternalModeSheet(
        content: Material(
      color: Colors.transparent,
      child: Column(
        children: [
          ExpansionTile(
            title: Text("提示词", style: _textStyle),
            collapsedTextColor: EternalColors.selectColor,
            backgroundColor: Colors.black38,
            collapsedBackgroundColor: Colors.black26,
            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
            collapsedShape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: EternalPadding.smallPadding,
                  right: EternalPadding.smallPadding,
                  bottom: EternalPadding.smallPadding,
                ),
                child: Text(_textContent, style: _textStyle),
              )
            ],
          ),
          ListTile(
            title: Text("分辨率", style: _textStyle),
            trailing: Chip(label: Text("宽:500 - 高:700", style: _secondTextStyle), backgroundColor: Colors.indigo),
          ),
          ListTile(
            title: Text("模型", style: _textStyle),
            trailing: Chip(label: Text("revAnimated_v122EOL_中国风", style: _secondTextStyle), backgroundColor: Colors.deepPurple),
          ),
          ListTile(
            title: Text("采样器", style: _textStyle),
            trailing: Chip(label: Text("DPM++ 2M Karras", style: _secondTextStyle), backgroundColor: Colors.deepPurpleAccent),
          ),
          ListTile(
            title: Text("迭代步数", style: _textStyle),
            trailing: Chip(label: Text("20", style: _secondTextStyle), backgroundColor: Colors.blueGrey),
          ),
          ListTile(
            title: Text("提示词引导系数", style: _textStyle),
            trailing: Chip(label: Text("2", style: _secondTextStyle), backgroundColor: Colors.cyan),
          ),
          ListTile(
            title: Text("随机数种子", style: _textStyle),
            trailing: Chip(label: Text("4151295931", style: _secondTextStyle)),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const StadiumBorder(),
                    minimumSize: const Size(180, 40),
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Colors.white, width: 1),
                    foregroundColor: Colors.white),
                icon: Icon(Icons.copy_rounded, size: EternalIconSize.smallSize),
                label: const Text("复制参数")),
          )
        ],
      ),
    ));
  }
}
