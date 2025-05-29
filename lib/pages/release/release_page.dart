import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/components/eternal_alert_dialog.dart';
import 'package:flutter_04/components/eternal_sheet_slip.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/main.dart';
import 'package:flutter_04/pages/release/details/release_details.dart';
import 'package:flutter_04/pages/release/publish/release_publish.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class ReleasePage extends StatefulWidget {
  const ReleasePage({super.key});

  @override
  State<ReleasePage> createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage> with TickerProviderStateMixin {
  int crossAxisCount = 2;
  double crossAxisSpacing = EternalMargin.miniMargin;
  double mainAxisSpacing = EternalMargin.miniMargin;
  bool _isManage = false;
  bool _isSelectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: EternalColors.defaultColor,
        title: Text("作品集（${Random().nextInt(100)}）"),
        actions: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isManage = !_isManage;
                    });
                  },
                  child: Text(
                    _isManage ? "取消管理" : "管理",
                    style: TextStyle(color: _isManage ? EternalColors.getDangerColor() : EternalColors.titleColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    EternalNavigatorRoute.push(context, const ReleasePublish());
                  },
                  child: const Text("发布"),
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverWaterfallFlow(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return SizedBox(
                      child: GestureDetector(
                        onLongPress: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 140,
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: EternalPadding.defaultPadding),
                                  child: Container(
                                    width: 250,
                                    padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: EternalColors.defaultColor,
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Column(
                                      children: [
                                        const EternalSheetSlip(),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // EternalNavigatorRoute.push(context, PersonCollectEdit());
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.download_for_offline_outlined,
                                                  size: EternalIconSize.defaultSize,
                                                ),
                                                const Text("下载本地")
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return EternalAlertDialog(
                                                      titleIcon: Icon(
                                                        Icons.error_rounded,
                                                        color: EternalColors.getDangerColor(),
                                                      ),
                                                      title: "警告",
                                                      content: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                image: DecorationImage(
                                                                    image: NetworkImage(EternalConstants.getImage()),
                                                                    fit: BoxFit.cover)),
                                                            clipBehavior: Clip.hardEdge,
                                                            width: 250,
                                                            height: 300,
                                                          ),
                                                          SizedBox(height: EternalMargin.defaultMargin),
                                                          const Text("确定删除此作品吗？"),
                                                        ],
                                                      ),
                                                      cancelContent: const Text("取消"),
                                                      confirmContent: const Text("确认"),
                                                      confirm: () {
                                                        Navigator.of(context).pop();
                                                        Navigator.of(context).pop();
                                                      },
                                                      cancel: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    );
                                                  });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: EternalColors.getDangerColor(),
                                              minimumSize: const Size(double.infinity, 40),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Icon(Icons.delete_sweep,
                                                    color: Colors.white, size: EternalIconSize.defaultSize),
                                                const Text("确认删除", style: TextStyle(color: Colors.white))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },

                        ///主体内容
                        child: WorkCardBody(isManage: _isManage),
                      ),
                    );
                  },
                  childCount: 50,
                ),
                gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: crossAxisSpacing,
                  mainAxisSpacing: mainAxisSpacing,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: _isManage ? 50 : 0,
                ),
              )
            ],
          ),

          ///工具栏
          Positioned(
            right: 0,
            bottom: -1,
            child: AnimatedContainer(
              width: equipmentWidth,
              height: _isManage ? 50 : 0,
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.only(
                  left: EternalPadding.smallPadding,
                  right: EternalPadding.smallPadding,
                  top: EternalPadding.miniPadding),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                color: EternalColors.defaultColor,
              ),
              curve: Curves.easeOutCirc,
              child: Offstage(
                offstage: !_isManage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          value: _isSelectAll,
                          onChanged: (value) {
                            setState(() {
                              _isSelectAll = !_isSelectAll;
                            });
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _isSelectAll = !_isSelectAll;
                              });
                            },
                            child: Text(_isSelectAll ? "取消全选" : "全选")),
                      ],
                    ),
                    
                    Wrap(
                      spacing: EternalMargin.smallMargin,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
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
                                        const Text("确定删除所选作品吗？"),
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
                          icon: Icon(Icons.delete,
                              size: EternalIconSize.smallSize, color: EternalColors.getDangerColor()),
                          label: Text("删除", style: TextStyle(color: EternalColors.getDangerColor())),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: EternalColors.getDangerColor()),
                            shape: const StadiumBorder(),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send_time_extension_sharp,
                            size: EternalIconSize.smallSize,
                            color: EternalColors.getSuccessColor(),
                          ),
                          label: Text("发布", style: TextStyle(color: EternalColors.getSuccessColor())),
                          style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(), side: BorderSide(color: EternalColors.getSuccessColor())),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              _isManage = !_isManage;
                            });
                          },
                          icon: Icon(Icons.settings, size: EternalIconSize.smallSize),
                          label: const Text("取消管理"),
                          style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkCardBody extends StatefulWidget {
  bool isManage;

  WorkCardBody({super.key, required this.isManage});

  @override
  State<WorkCardBody> createState() => _WorkCardBodyState();
}

class _WorkCardBodyState extends State<WorkCardBody> {
  bool isCheck = false;
  String image = EternalConstants.getImage();
  int ratio = Random().nextInt(16);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double imageHeight = Random().nextInt(350).toDouble();
      return InkWell(
        onTap: () {
          ///选中
          if (widget.isManage) {
            setState(() {
              isCheck = !isCheck;
            });
          } else {
            ///跳转到作品详情
            EternalNavigatorRoute.push(context, ReleaseDetails());
          }
        },
        child: Container(
          width: double.infinity,
          height: imageHeight < 180 ? 180 : imageHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
          child: Wrap(
            children: [
              Visibility(
                visible: widget.isManage,
                child: Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  // checkColor: EternalColors.getPrimaryColor(),
                  value: isCheck,
                  onChanged: (bool? value) {
                    if (widget.isManage) {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: widget.isManage ? 0 : EternalMargin.smallMargin),
                child: Chip(
                  backgroundColor: Colors.black,
                  label: const Text("古风", style: TextStyle(fontSize: 12)),
                  labelPadding: const EdgeInsets.only(top: -5, bottom: -5),
                  padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
