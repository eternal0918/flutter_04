import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/entity/home/search/search_list.dart';

class HomeSearchModelAndTheme extends StatefulWidget {
  HomeSearchModelAndTheme({Key? key}) : super(key: key);

  @override
  _HomeSearchModelAndThemeState createState() => _HomeSearchModelAndThemeState();
}

class _HomeSearchModelAndThemeState extends State<HomeSearchModelAndTheme> {
  final List<SearchList> _searchList = <SearchList>[];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 2; i++) {
      List<Search> searchList = <Search>[];
      for (int j = 0; j < 10; j++) {
        searchList.add(Search(j + 1, Random().nextInt(300), "赛博朋克"));
      }

      _searchList.add(SearchList("模型热榜", searchList));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 640,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          SearchList searchListItem = _searchList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bubble_chart_rounded,
                    size: EternalIconSize.smallSize,
                    color: Colors.deepPurple,
                  ),
                  label: Text(searchListItem.title, style: TextStyle(color: EternalColors.titleColor))),
              SizedBox(height: EternalMargin.miniMargin),
              Container(
                width: 250,
                height: 580,
                padding: EdgeInsets.symmetric(vertical: EternalPadding.smallPadding),
                decoration:
                    BoxDecoration(color: EternalColors.boxDefaultColor, borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Search searchItem = searchListItem.searchList[index];
                    return ListTile(
                      title: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: EternalMargin.smallMargin,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: index > 2
                                ? null
                                : BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.red),
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          Text(searchItem.name, style: TextStyle(color: EternalColors.titleColor, fontSize: 13)),
                        ],
                      ),
                      trailing: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.whatshot_rounded,
                            size: EternalIconSize.smallSize,
                            color: EternalColors.getDangerColor(),
                          ),
                          label: Text("${searchItem.count}万", style: TextStyle(color: EternalColors.getDangerColor()))),
                    );
                  },
                  itemCount: 10,
                ),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: EternalMargin.defaultMargin);
        },
      ),
    );
  }
}
