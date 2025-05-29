import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

///搜索历史
class HomeSearchHistory extends StatefulWidget {
  HomeSearchHistory({super.key});

  @override
  State<HomeSearchHistory> createState() => _HomeSearchHistoryState();
}

class _HomeSearchHistoryState extends State<HomeSearchHistory> {
  double _height = 0;
  GlobalKey _containerKey = GlobalKey();
  List<String> _searchHisList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _searchHisList.add("$i");
    }
    print("初始化");

    ///获取容器高度
    _getContainerSize();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.access_time,
                  size: EternalIconSize.smallSize,
                  color: EternalColors.getWarningColor(),
                ),
                label: const Text("搜索历史", style: TextStyle(color: EternalColors.titleColor))),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _searchHisList = [];
                  _getContainerSize();
                });
              },
              icon: Icon(
                Icons.cleaning_services_rounded,
                size: EternalIconSize.smallSize,
                color: EternalColors.secondTextColor,
              ),
              label: const Text("清除", style: TextStyle(color: EternalColors.secondTextColor)),
            ),
          ],
        ),

        SizedBox(height: EternalMargin.miniMargin),

        ///搜索历史关键字
        AnimatedContainer(
          height: _height,
          padding: EdgeInsets.symmetric(
            vertical: EternalPadding.smallPadding,
            horizontal: EternalPadding.defaultPadding,
          ),
          decoration: BoxDecoration(color: EternalColors.boxDefaultColor, borderRadius: BorderRadius.circular(10)),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              SizedBox(
                key: _containerKey,
                width: double.infinity,
                child: Wrap(
                  spacing: EternalMargin.smallMargin,
                  children: _searchHisList.asMap().entries.map((searchItem) {
                    String value = searchItem.value;
                    return Chip(
                      onDeleted: () {
                        setState(() {
                          _searchHisList.removeAt(searchItem.key);
                          // print("下标为$searchItem.key数据$_searchHisList");
                          _getContainerSize();
                        });
                      },
                      label: Text(
                        "关闭三星更新$value",
                        style: TextStyle(fontSize: 12, color: EternalColors.textColor),
                      ),
                      deleteIcon: Icon(
                        Icons.cancel,
                        color: EternalColors.secondTextColor,
                        size: EternalIconSize.defaultSize,
                      ),
                      deleteButtonTooltipMessage: "",
                      backgroundColor: EternalColors.defaultColor,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: TextButton.icon(
                  onPressed: () {
                    int count = _searchHisList.length;
                    setState(() {
                      for (int i = count; i < count + 5; i++) {
                        _searchHisList.add("$i");
                      }
                      _getContainerSize();
                    });
                  },
                  icon: Icon(
                    Icons.keyboard_double_arrow_down,
                    size: EternalIconSize.defaultSize,
                    color: EternalColors.secondTextColor,
                  ),
                  label: const Text("展开更多搜索历史", style: TextStyle(color: EternalColors.secondTextColor)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  //获取元素高度
  _getContainerSize() {
    ///元素构建时需要时间，待构建完成后再获取元素高度
    Future.delayed(const Duration(milliseconds: 100), () {
      final size = _containerKey.currentContext?.size?.height;
      setState(() {
        _height = 60 + (size ?? 0);
      });
      // print('$size');
    });
  }
}
