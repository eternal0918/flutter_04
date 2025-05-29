import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:photo_view/photo_view.dart';

class ReleasePublishResolution extends StatefulWidget {
  const ReleasePublishResolution({Key? key}) : super(key: key);

  @override
  _ReleasePublishResolutionState createState() => _ReleasePublishResolutionState();
}

class _ReleasePublishResolutionState extends State<ReleasePublishResolution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: EternalColors.defaultColor, title: const Text("超分放大"), elevation: 0),
      backgroundColor: EternalColors.defaultColor,
      bottomNavigationBar: const ReleasePublishResolutionSetting(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ///原图
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage.assetNetwork(
                        alignment: Alignment.center,
                        image: EternalConstants.getImage(),
                        fit: BoxFit.fitHeight,
                        placeholderScale: 2,
                        placeholder: 'assets/images/loading/Rhombus.gif',
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: EternalMargin.smallMargin,
                    child: ElevatedButton(
                        onPressed: () {},
                        style:
                            ElevatedButton.styleFrom(shape: const StadiumBorder(), backgroundColor: Colors.transparent),
                        child: const Text("原图（ 宽*高 : 512*512 ）", style: TextStyle(color: EternalColors.titleColor)))),
              ],
            ),
          ),
          SliverPadding(
            sliver: const SliverToBoxAdapter(
              child: DottedDashedLine(
                axis: Axis.horizontal,
                dashColor: EternalColors.secondaryColor,
                width: double.maxFinite,
                strokeWidth: 2,
                dashSpace: 5,
                height: 2,
              ),
            ),
            padding: EdgeInsets.all(EternalPadding.smallPadding),
          ),

          ///放大后的图片
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage.assetNetwork(
                        alignment: Alignment.center,
                        image: EternalConstants.getImage(),
                        fit: BoxFit.fitHeight,
                        placeholderScale: 2,
                        placeholder: 'assets/images/loading/Rhombus.gif',
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: EternalMargin.smallMargin,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text("超分后（ 宽*高 : 512*512 ）", style: TextStyle(color: EternalColors.titleColor)),
                    )),
              ],
            ),
          ),

          ///底部边距
          SliverPadding(padding: EdgeInsets.all(EternalPadding.smallPadding)),

          SliverToBoxAdapter(
            child: Container(child:  PhotoView(
              imageProvider: NetworkImage(EternalConstants.randomImageUrl),
            ),width: double.maxFinite,height: 200,),
          )
        ],
      ),
    );
  }
}

///底部 放大条件
class ReleasePublishResolutionSetting extends StatefulWidget {
  const ReleasePublishResolutionSetting({super.key});

  @override
  State<ReleasePublishResolutionSetting> createState() => _ReleasePublishResolutionSettingState();
}

class _ReleasePublishResolutionSettingState extends State<ReleasePublishResolutionSetting> {
  //倍数
  double weightValue = 3;

  List<String> resolutionModeList = [
    "Lanczos",
    "Nearest",
    "4x-UltraSharp",
    "BSRGAN",
    "ESRGAN_4x",
    "LDSR",
    "R-ESRGAN 4x+",
    "R-ESRGAN 4x+ Anime6B",
    "ScuNET",
    "ScuNET PSNR",
    "SwinIR_4x",
  ];

  String selectedResolutionMode = "4x-UltraSharp";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(EternalPadding.smallPadding),
      decoration: const BoxDecoration(
          color: EternalColors.boxDefaultColor, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: EternalPadding.smallPadding,
                children: [
                  Icon(Icons.two_k_outlined, color: EternalColors.getPrimaryColor()),
                  const Text("放大倍数"),
                  Chip(
                    backgroundColor: EternalColors.secondaryColor,
                    label:
                        Text("${(weightValue * 512).toStringAsFixed(0)}*${(weightValue * 512).toStringAsFixed(0)}（px）"),
                  ),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Slider(
                    value: weightValue,
                    max: 4.00,
                    min: 1.00,
                    divisions: 12,
                    label: weightValue.toStringAsFixed(2),
                    onChanged: (double value) {
                      setState(() {
                        weightValue = value;
                      });
                    },
                  ),
                  Text(weightValue.toStringAsFixed(2))
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: EternalPadding.smallPadding,
                children: const [Icon(Icons.miscellaneous_services_rounded, color: Colors.blue), Text("放大算法")],
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => StatefulBuilder(builder: (context, state) {
                            return Container(
                              // margin: EdgeInsets.only(
                              //   left: EternalMargin.miniMargin,
                              //   right: EternalMargin.miniMargin,
                              //   bottom: EternalMargin.miniMargin,
                              // ),
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                  color: EternalColors.defaultColor,
                                  borderRadius: BorderRadius.all(Radius.circular(15))),

                              ///构建弹框中的内容
                              child: Material(
                                  color: Colors.transparent,
                                  child: ListView(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      children: resolutionModeList
                                          .map((resolutionModeName) => ListTile(
                                              title: Center(child: Text(resolutionModeName)),
                                              onTap: () => {
                                                    setState(() {
                                                      selectedResolutionMode = resolutionModeName;
                                                      Navigator.pop(context);
                                                    })
                                                  }))
                                          .toList())),
                            );
                          }));
                },
                child: Text(selectedResolutionMode),
              )
            ],
          ),

          ///底部确认按钮
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text("确认"),
            icon: const Icon(Icons.start_rounded),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.maxFinite, 40),
              // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
          )
        ],
      ),
    );
  }
}
