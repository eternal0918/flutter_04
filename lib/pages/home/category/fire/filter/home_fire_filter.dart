import 'package:flutter/material.dart';
import 'package:flutter_04/components/eternal_sheet_slip.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/entity/eternal_entity.dart';
import 'package:flutter_04/main.dart';
import 'package:flutter_04/notification/home/home_fire_filter_theme_notification.dart';

import 'home_fire_filter_model_grid.dart';
import 'home_fire_filter_tab.dart';
import 'home_fire_filter_theme_grid.dart';

class HomeFireFilter extends StatefulWidget {
  const HomeFireFilter({Key? key}) : super(key: key);

  @override
  _HomeFireFilterState createState() => _HomeFireFilterState();
}

class _HomeFireFilterState extends State<HomeFireFilter> with TickerProviderStateMixin {
  final List<EternalTabItem> _modelTabNameList = [
    EternalTabItem(0, "热门"),
    EternalTabItem(1, "大模型"),
    EternalTabItem(2, "动漫"),
    EternalTabItem(3, "真人"),
    EternalTabItem(4, "建筑"),
    EternalTabItem(5, "剪纸")
  ];

  final List<EternalTabItem> _styleTabNameList = [
    EternalTabItem(0, "热门"),
    EternalTabItem(1, "3D"),
    EternalTabItem(2, "画质优化"),
    EternalTabItem(3, "光影"),
    EternalTabItem(4, "动漫"),
    EternalTabItem(5, "国风"),
    EternalTabItem(6, "自然"),
    EternalTabItem(7, "未来"),
    EternalTabItem(8, "风格")
  ];

  //主题列表
  List<EternalThemeItem> _themeItemList = [];

  //选中的主题
  List<EternalThemeItem> _themeSelectedItemList = [];

  //模型列表
  List<EternalModelItem> _modelItemList = [];

  //选中的模型
  EternalModelItem _modelSelectedItem = EternalModelItem(id: 0, name: "墨幽", imageUrl: "");

  @override
  void initState() {
    for (int i = 1; i < 20; i++) {
      _modelItemList.add(EternalModelItem(id: i, name: "墨幽$i", imageUrl: EternalConstants.getImage()));
      _themeItemList.add(EternalThemeItem(id: i, name: "国风暗香$i", weight: 0.0, imageUrl: EternalConstants.getImage()));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<HomeFireFilterThemeNotification>(
        onNotification: (notification) {
          setState(() {
            if (notification.type == 'theme') {
              if (_themeSelectedItemList.contains(notification.selectedThemeItem)) {
                _themeSelectedItemList.remove(notification.selectedThemeItem);
              } else {
                _themeSelectedItemList.add(notification.selectedThemeItem);
              }
            }
            if (notification.type == 'model') {
              _modelSelectedItem = notification.selectedModelItem;
            }
          });
          return true;
        },
        child: Container(
          height: equipmentHeight * 0.8,
          padding: EdgeInsets.only(
            left: EternalPadding.smallPadding,
            right: EternalPadding.smallPadding,
            bottom: EternalPadding.miniPadding,
          ),
          margin: EdgeInsets.only(
            left: EternalMargin.miniMargin,
            right: EternalMargin.miniMargin,
            bottom: EternalMargin.miniMargin,
          ),
          decoration: BoxDecoration(color: EternalColors.defaultColor, borderRadius: BorderRadius.circular(15)),
          child: DefaultTabController(
            length: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(65),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: EternalColors.defaultColor,
                  title: const EternalSheetSlip(),
                  leading: const Text(""),
                  centerTitle: true,
                  bottom: const TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(child: Text("SD")),
                      // Tab(child: Text("B模型")),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: EternalMargin.smallMargin),
                    child: ListView(
                      children: [
                        ExpansionTile(
                          childrenPadding: EdgeInsets.all(EternalPadding.defaultPadding),
                          backgroundColor: Colors.black12,
                          collapsedTextColor: EternalColors.secondTextColor,
                          collapsedIconColor: EternalColors.secondTextColor,
                          collapsedBackgroundColor: EternalColors.boxDefaultColor,
                          collapsedShape: StadiumBorder(),
                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          title: Text("所选内容"),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("模型"),
                                SizedBox(
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: _modelSelectedItem.bgColor, shape: StadiumBorder()),
                                      child: Text("${_modelSelectedItem.name}", style: TextStyle(color: Colors.white)),
                                    ))
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(flex: 1, child: Text("主题")),
                                Expanded(
                                    flex: 3,
                                    child: Wrap(
                                      alignment: WrapAlignment.end,
                                      spacing: EternalMargin.miniMargin,
                                      runSpacing: EternalMargin.miniMargin,
                                      children: _themeSelectedItemList
                                          .map((themeItem) => Container(
                                                height: 30,
                                                width: 120,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: themeItem.bgColor, shape: StadiumBorder()),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("${themeItem.name}", style: TextStyle(color: Colors.white)),
                                                      Text(
                                                        "${themeItem.weight.toStringAsFixed(2)}",
                                                        style: TextStyle(color: Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    double weightValue = themeItem.weight;
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return StatefulBuilder(builder: (context, state) {
                                                            return SimpleDialog(
                                                              backgroundColor: EternalColors.defaultColor,
                                                              shape: ContinuousRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(50)),
                                                              children: [
                                                                Slider(
                                                                  value: weightValue,
                                                                  max: 1.00,
                                                                  min: 0.00,
                                                                  divisions: 20,
                                                                  label: weightValue.toString(),
                                                                  onChanged: (double value) {
                                                                    state(() {
                                                                      weightValue = value;
                                                                    });
                                                                    setState(() {
                                                                      themeItem.weight = weightValue;
                                                                    });
                                                                  },
                                                                )
                                                              ],
                                                            );
                                                          });
                                                        });
                                                  },
                                                ),
                                              ))
                                          .toList(),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: EternalMargin.defaultMargin),
                        HomeFireFilterTab(title: "模型", tabList: _modelTabNameList),
                        SizedBox(height: EternalMargin.smallMargin),
                        HomeFireFilterModelGrid(modelList: _modelItemList),
                        SizedBox(height: EternalMargin.defaultMargin),
                        HomeFireFilterTab(title: "主题", tabList: _styleTabNameList),
                        SizedBox(height: EternalMargin.smallMargin),
                        HomeFireFilterThemeGrid(themeList: _themeItemList),
                        SizedBox(height: EternalMargin.defaultMargin),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 100,
                  //   child: GridView.count(
                  //     crossAxisCount: 2,
                  //     scrollDirection: Axis.horizontal,
                  //     children: List.generate(4, (index) {
                  //       return Center(
                  //         child: Text('Item $index'),
                  //       );
                  //     }),
                  //   ),
                  // )
                ],
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.only(top: EternalPadding.smallPadding),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(right: EternalPadding.miniPadding),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.rotate_left_rounded, color: Colors.white),
                          label: Text("重置", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: EternalColors.unSelectColor,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: EternalPadding.miniPadding),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.check_rounded),
                          label: Text("确认"),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
