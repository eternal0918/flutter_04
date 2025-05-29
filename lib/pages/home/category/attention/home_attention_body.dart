import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

import '../home_category_sliver_grid.dart';

class HomeAttentionBody extends StatefulWidget {
  int categoryIndex = 0;

  HomeAttentionBody({Key? key, required this.categoryIndex}) : super(key: key);

  @override
  _HomeAttentionBodyState createState() => _HomeAttentionBodyState(categoryIndex: categoryIndex);
}

class _HomeAttentionBodyState extends State<HomeAttentionBody> with TickerProviderStateMixin {
  late AnimationController _controller;

  int categoryIndex;

  _HomeAttentionBodyState({required this.categoryIndex});

  int _num = 10;
  bool _isLoading = false;
  final bool _isRefreshing = false;
  String loadingText = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification && notification.depth == 0 && !_isLoading && !_isRefreshing) {
            if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
              setState(() {
                _isLoading = true;
                loadingText = "加载中.....";
                _num += 20;
                // print("打印:${_num}");
              });
              _RrefreshPull().then((value) {
                setState(() {
                  _isLoading = false;
                });
              }).catchError((error) {
                setState(() {
                  _isLoading = true;
                  loadingText = "加载失败.....";
                });
              });
            }
          }
          return _isLoading;
        },
        child: RefreshIndicator(
          onRefresh: () {
            if (_isLoading) ;
            return _RrefreshPull().then((value) {
              setState(() {
                _num += 20;
              });
            }).catchError((error) {
              print('failed');
            });
          },
          child: CustomScrollView(
            slivers: [
              ///显示在屏幕的安全区域，在状态栏下面展示，而非在整个屏幕显示
              SliverSafeArea(
                sliver: SliverPadding(
                  padding: EdgeInsets.all(EternalPadding.miniPadding),
                  sliver: HomeCategorySliverGrid(num: _num),
                ),
              ),

              /// 加载区域
              SliverToBoxAdapter(
                child: Visibility(
                  visible: _isLoading,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: EternalPadding.smallPadding),
                    height: 100,
                    child: Center(
                      child: Text(loadingText),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<String> _RrefreshPull() async {
    await Future.delayed(new Duration(seconds: 1));
    return "_RrefreshPull";
  }
}
