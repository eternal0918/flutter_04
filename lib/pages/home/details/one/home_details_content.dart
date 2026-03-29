import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:vibration/vibration.dart';

import '../../../../toasts/CustomAnimationWidget.dart';
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

  String _prompt = "city future,8k,exploration,cinematic,realistic,unreal engine,hyper detailed,volumetric light,moody cinematic epic concept art,"
      "realistic matte painting,hyper photorealistic,Negative prompt: lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst "
      "quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist nameSteps: 20, Sampler: Euler a, CFG scale: 10, Seed: 2892782840, Size: 896x512, Model hash: 879db523c3, Model: dreamshaper_8, VAE hash: 63aeecb90f,VAE: vae-ft-mse-840000-ema-pruned.safetensors, Denoising strength: 0.6, Clip skip: 2, ENSD: 31337, Hires upscale: 2, Hires upscaler: Latent, Version: v1.6.0";

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

        ///详细参数
        ExpansionTile(
          initiallyExpanded: true,
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
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("宽:500 - 高:700", style: _chipTextStyle),
              ),
            ),
            ListTile(
              title: Text("模型", style: _textStyle),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("revAnimated_v122EOL_中国风", style: _chipTextStyle),
              ),
            ),
            ListTile(
              title: Text("采样器", style: _textStyle),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("DPM++ 2M Karras", style: _chipTextStyle),
              ),
            ),
            ListTile(
              title: Text("迭代步数", style: _textStyle),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("20", style: _chipTextStyle),
              ),
            ),
            ListTile(
              title: Text("提示词引导系数", style: _textStyle),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("2", style: _chipTextStyle),
              ),
            ),
            ListTile(
              title: Text("随机数种子", style: _textStyle),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("4151295931", style: _chipTextStyle),
              ),
            ),
            SizedBox(height: EternalMargin.smallMargin),
            Material(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onLongPress: () {
                  Vibration.vibrate(duration: 10, amplitude: 80);
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已复制')));
                  BotToast.showText(
                    contentPadding: EdgeInsets.symmetric(vertical: EternalPadding.smallPadding, horizontal: EternalPadding.defaultPadding),
                    contentColor: Colors.white,
                    text: '已复制',
                    textStyle: TextStyle(fontSize: EternalFontSize.regular(), color: Colors.black),
                    wrapToastAnimation: (controller, cancel, Widget child) => CustomAnimationWidget(controller: controller, child: child),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(EternalPadding.normalPadding),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: EternalColors.titleColor, fontSize: EternalFontSize.medium(), fontFamily: "videopac"),
                          children: [
                            const TextSpan(text: 'Prompt '),
                            TextSpan(
                              text: '描述词',
                              style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular()),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: EternalMargin.smallMargin),
                      Text(_prompt, style: TextStyle(color: EternalColors.textColor, fontSize: EternalFontSize.regular(), height: 1.5)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: EternalMargin.smallMargin),

        ///上一个 下一个按钮
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "共 ${Random().nextInt(100)} 条评论",
              style: TextStyle(color: EternalColors.selectColor, fontSize: EternalFontSize.regular()),
            ),
            Wrap(
              spacing: EternalMargin.smallMargin,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text("上一个", style: TextStyle(color: EternalColors.selectColor)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.black26,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text("下一个", style: TextStyle(color: EternalColors.selectColor)),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
