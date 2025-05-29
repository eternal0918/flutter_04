import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/components/eternal_alert_dialog.dart';
import 'package:flutter_04/components/eternal_sheet_slip.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/person/collect/person_collect_detail.dart';
import 'package:flutter_04/pages/person/collect/person_collect_add.dart';
import 'package:flutter_04/pages/person/collect/person_collect_edit.dart';

class PersonCollect extends StatefulWidget {
  const PersonCollect({Key? key}) : super(key: key);

  @override
  _PersonCollectState createState() => _PersonCollectState();
}

class _PersonCollectState extends State<PersonCollect> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: EternalPadding.smallPadding,
        right: EternalPadding.smallPadding,
        top: EternalPadding.smallPadding,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: EternalMargin.defaultMargin),
            padding: EdgeInsets.only(right: EternalPadding.smallPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: EternalMargin.smallMargin,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.star_rounded, color: Colors.orange, size: EternalIconSize.defaultSize),
                    const Text(
                      "我的收藏单",
                      style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    EternalNavigatorRoute.push(context, PersonCollectAdd());
                  },
                  child: Icon(Icons.add_rounded),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: EternalColors.boxDefaultColor, borderRadius: BorderRadius.circular(20)),
              child: ListView.separated(
                padding: EdgeInsets.only(left: EternalPadding.smallPadding, right: EternalPadding.smallPadding, top: EternalPadding.defaultPadding),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      // print("长按");
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
                                          EternalNavigatorRoute.push(context, PersonCollectEdit());
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [Icon(Icons.border_color, size: EternalIconSize.defaultSize), const Text("修改")],
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
                                                  content: Wrap(
                                                    direction: Axis.vertical,
                                                    spacing: EternalMargin.smallMargin,
                                                    children: [
                                                      Text(
                                                        "收藏夹$index",
                                                        style: const TextStyle(color: EternalColors.secondTextColor, fontSize: 13),
                                                      ),
                                                      const Text("确定删除此收藏夹吗？"),
                                                      Text(
                                                        "删除后，收藏夹里的内容将被移除，请熟知。",
                                                        style: TextStyle(
                                                          color: EternalColors.getDangerColor(),
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  cancelContent: const Text("取消"),
                                                  confirmContent: Text("确认"),
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
                                            Icon(Icons.delete_sweep, color: Colors.white, size: EternalIconSize.defaultSize),
                                            const Text("删除", style: TextStyle(color: Colors.white))
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
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.hardEdge,
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                            leading: Container(
                              width: 70 * (4 / 3),
                              height: 70,
                              decoration: BoxDecoration(
                                color: EternalColors.defaultColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: index % 2 == 0
                                  ? Image.network(EternalConstants.getImage(), fit: BoxFit.cover)
                                  : const Icon(Icons.folder_special_rounded, size: 35),
                            ),
                            title: Text(
                              "收藏夹${index + 1}",
                              style: const TextStyle(color: EternalColors.titleColor),
                            ),
                            subtitle: Wrap(
                              spacing: EternalMargin.miniMargin,
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  "xxxxxxxxxxxxxxxxxxxxxxxx个内容$index",
                                  style: const TextStyle(fontSize: 12, color: EternalColors.secondTextColor),
                                ),
                                Text(
                                  "${index * 2}个内容",
                                  style: const TextStyle(fontSize: 12, color: EternalColors.secondTextColor),
                                )
                              ],
                            ),
                            // trailing:
                            // Icon(
                            //   Icons.chevron_right,
                            //   color: Colors.white,
                            //   size: EternalIconSize.defaultSize,
                            // ),
                            onTap: () {
                              EternalNavigatorRoute.push(context, PersonCollectDetail());
                            }),
                      ),
                    ),
                  );
                },
                itemCount: 100,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: EternalMargin.smallMargin);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
