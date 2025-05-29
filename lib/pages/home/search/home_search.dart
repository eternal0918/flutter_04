import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/search/two/home_search_two.dart';

import 'one/home_search_one.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  late PageController _pageController;

  @override
  void initState() {
    ///页面视图设置
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1, //页面占比 0~1
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: EternalColors.defaultColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: EternalColors.defaultColor,
          leadingWidth: constraints.maxWidth,
          leading: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.arrow_back), splashRadius: 20, onPressed: () => Navigator.of(context).pop()),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onTap: () {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    style: const TextStyle(color: EternalColors.textColor),
                    scrollPadding: EdgeInsets.zero,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: EternalPadding.defaultPadding),
                      suffixIcon: InkWell(
                        onTap: () {
                          // print("点击搜索");
                          _pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn,
                          );

                          ///搜索后 关闭键盘并失去焦点
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: const Icon(Icons.search_rounded),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: '赛博朋克',
                    ),
                  ),
                ),
              ),
              SizedBox(width: EternalMargin.defaultMargin)
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeSearchOne(),
            HomeSearchTwo(),
          ],
        ),
      );
    });
  }
}
