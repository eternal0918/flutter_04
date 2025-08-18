import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

import 'home_details_tags.dart';

class HomeDetailsContent extends StatefulWidget {
  const HomeDetailsContent({Key? key}) : super(key: key);

  @override
  _HomeDetailsContentState createState() => _HomeDetailsContentState();
}

class _HomeDetailsContentState extends State<HomeDetailsContent> {
  String title = EternalConstants.getMockData.lorem.sentence();

  String textContent =
      "一个适合做场景设定集，场景插画，儿童探险绘本的lora，画风整体比较治愈，场景大部分采用远景/广角，所以在人物方面上的细节不会很好，比较偏向于场景类的一个lora，不过测试后发现权重0.4-0.6的情况下，搭配其他人物lora，会保持画风的情况下提升人物细节。";
  final TextStyle _textStyle = TextStyle(color: EternalColors.textColor, fontSize: EternalFontSize.regular());
  final TextStyle _chipTextStyle = TextStyle(color: EternalColors.titleColor, fontSize: EternalFontSize.regular());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: EternalMargin.defaultMargin),
        Text(title, style: TextStyle(fontSize: EternalFontSize.large(), fontWeight: FontWeight.bold)),
        SizedBox(height: EternalMargin.smallMargin),
        Text(textContent, style: TextStyle(fontSize: EternalFontSize.regular(), height: 1.7)),
        SizedBox(height: EternalMargin.smallMargin),
        ///标签
        const HomeDetailsTags(),
        SizedBox(height: EternalMargin.smallMargin),
        ExpansionTile(
          collapsedTextColor: EternalColors.selectColor,
          backgroundColor: Colors.black38,
          collapsedBackgroundColor: Colors.black26,
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
          collapsedShape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
          trailing: Icon(Icons.dataset_linked_rounded, size: EternalIconSize.defaultSize),
          title: Text("参数", style: TextStyle(fontSize: EternalFontSize.regular())),
          children: [
            ListTile(
              title: Text("分辨率", style: _textStyle),
              trailing: Chip(label: Text("宽:500 - 高:700", style: _chipTextStyle), backgroundColor: Colors.indigo),
            ),
            ListTile(
              title: Text("模型", style: _textStyle),
              trailing: Chip(label: Text("revAnimated_v122EOL_中国风", style: _chipTextStyle), backgroundColor: Colors.deepPurple),
            ),
            ListTile(
              title: Text("采样器", style: _textStyle),
              trailing: Chip(label: Text("DPM++ 2M Karras", style: _chipTextStyle), backgroundColor: Colors.deepPurpleAccent),
            ),
            ListTile(
              title: Text("迭代步数", style: _textStyle),
              trailing: Chip(label: Text("20", style: _chipTextStyle), backgroundColor: Colors.blueGrey),
            ),
            ListTile(
              title: Text("提示词引导系数", style: _textStyle),
              trailing: Chip(label: Text("2", style: _chipTextStyle), backgroundColor: Colors.cyan),
            ),
            ListTile(
              title: Text("随机数种子", style: _textStyle),
              trailing: Chip(label: Text("4151295931", style: _chipTextStyle)),
            ),

            // ListTile(title: Text("外挂VAE模型", style: textStyle), trailing: Chip(label: Text("vae-ft-mse-840000-ema-pruned.safetensors"))),
            // ListTile(title: Text("终止层数", style: textStyle), trailing: Chip(label: Text("2"))),
            // ListTile(title: Text("分辨率", style: textStyle), trailing: Chip(label: Text("500x700"))),
          ],
        )
      ],
    );
  }
}
