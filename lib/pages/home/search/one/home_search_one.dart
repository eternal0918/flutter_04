import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

import 'home_search_history.dart';
import 'home_search_hot.dart';
import 'home_search_model_and_theme.dart';

class HomeSearchOne extends StatefulWidget {
  const HomeSearchOne({super.key});

  @override
  State<HomeSearchOne> createState() => _HomeSearchOneState();
}

class _HomeSearchOneState extends State<HomeSearchOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
      child: CustomScrollView(
        slivers: [
          ///搜索历史
          SliverToBoxAdapter(child: HomeSearchHistory()),
          SliverToBoxAdapter(child: SizedBox(height: EternalMargin.defaultMargin)),

          ///热门搜索
          SliverToBoxAdapter(child: HomeSearchHot()),
          SliverToBoxAdapter(child: SizedBox(height: EternalMargin.defaultMargin)),

          ///模型、主题热榜
          SliverToBoxAdapter(child: HomeSearchModelAndTheme()),
          SliverToBoxAdapter(child: SizedBox(height: EternalMargin.smallMargin))
        ],
      ),
    );
  }
}
