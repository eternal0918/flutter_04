import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/components/eternal_alert_dialog.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/one/home_details_one.dart';
import 'package:flutter_04/pages/home/details/two/index/home_details_fire_plate.dart';
import 'package:flutter_04/pages/person/collect/person_collect_edit.dart';

class PersonCollectDetail extends StatefulWidget {
  const PersonCollectDetail({Key? key}) : super(key: key);

  @override
  _PersonCollectDetailState createState() => _PersonCollectDetailState();
}

enum Calendar { day, week, month, year }

class _PersonCollectDetailState extends State<PersonCollectDetail> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              backgroundColor: EternalColors.defaultColor,
              actions: [
                Theme(
                  data: Theme.of(context).copyWith(cardColor: EternalColors.boxDefaultColor),
                  child: PopupMenuButton(
                    tooltip: "更多",
                    splashRadius: 20,
                    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    clipBehavior: Clip.hardEdge,
                    onSelected: (index) {
                      switch (index) {
                        case 0:
                          EternalNavigatorRoute.push(context, PersonCollectEdit());
                          break;
                        case 1:
                          showDialog(
                              context: context,
                              builder: (context) {
                                return EternalAlertDialog(
                                  titleIcon: Icon(Icons.error_rounded, color: EternalColors.getDangerColor()),
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
                                        style: TextStyle(color: EternalColors.getDangerColor(), fontSize: 13),
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
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        value: 0,
                        child: Text('修改信息'),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text('删除'),
                      ),
                    ],
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 250,
                  padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(EternalConstants.randomImageUrl),
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcOver))),
                  child: const Center(
                    child: Text("吾尝终日而思矣，不如须臾之所学也；吾尝跂而望矣，不如登高之博见也。"),
                  ),
                ),
                title: Text("摄影"),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(
            left: EternalPadding.smallPadding,
            right: EternalPadding.smallPadding,
            top: EternalPadding.defaultPadding,
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      EternalNavigatorRoute.push(context, HomeDetailsOne());
                    },
                    child: HomeDetailsFirePlate(index: 1),
                  );
                }, childCount: 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
