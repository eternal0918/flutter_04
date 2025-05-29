import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

import 'home_search_sliver_list.dart';

class HomeSearchUser extends StatefulWidget {
  double headHeight;

  HomeSearchUser({Key? key, required this.headHeight}) : super(key: key);

  @override
  _HomeSearchUserState createState() => _HomeSearchUserState();
}

class _HomeSearchUserState extends State<HomeSearchUser> {
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
          if (_isLoading) {}
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
            ///头部动画
            SliverToBoxAdapter(
              child: AnimatedContainer(
                height: widget.headHeight,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              ),
            ),

            ///内容
            HomeSearchSliverList(num: _num),

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
      ),
    );
  }

  Future<String> _RrefreshPull() async {
    await Future.delayed(const Duration(seconds: 1));
    return "_RrefreshPull";
  }
}
