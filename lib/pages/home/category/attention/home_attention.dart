import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/inherited/home/home_attention_widget.dart';
import 'package:flutter_04/pages/home/category/attention/home_attention_body.dart';

class HomeAttention extends StatefulWidget {
  const HomeAttention({super.key});

  @override
  State<HomeAttention> createState() => _HomeAttentionState();
}

class _HomeAttentionState extends State<HomeAttention> {
  bool _isGroupView = true;
  int _tabNum = 0;
  final List<Tab> _tabList = [];
  final List<HomeAttentionBody> _categoryList = [];

  @override
  void initState() {
    super.initState();
    _tabNum = 8;
    for (int i = 0; i < _tabNum; i++) {
      _tabList.add(Tab(text: "你好"));
      _categoryList.add(HomeAttentionBody(categoryIndex: i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeAttentionWidget(
        isGroupView: _isGroupView,
        child: Scaffold(
          backgroundColor: EternalColors.defaultColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: _tabNum,
                    child: AppBar(
                      elevation: 0,
                      backgroundColor: EternalColors.defaultColor,
                      bottom: TabBar(
                        isScrollable: true,
                        indicatorColor:  EternalColors.getPrimaryColor(),
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: EternalColors.unSelectColor,
                        indicatorWeight: 2,
                        tabs: _tabList,
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isGroupView = !_isGroupView;
                          // bus.fire(HomeGridEvent(_isGroupView));
                        });
                      },
                      splashRadius: 20,
                      icon: _isGroupView ? Icon(Icons.apps_rounded) : Icon(Icons.view_list_rounded),
                    ))
              ],
            ),
          ),
          body: TabBarView(
            children: _categoryList,
          ),
        ));
  }
}
