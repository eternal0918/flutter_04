import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/category/home_category_simple_details.dart';
import 'package:flutter_04/pages/home/details/home_details.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomeRecommend extends StatefulWidget {
  const HomeRecommend({Key? key}) : super(key: key);

  @override
  _HomeRecommendState createState() => _HomeRecommendState();
}

class _HomeRecommendState extends State<HomeRecommend> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int crossAxisCount = 2;
  double crossAxisSpacing = EternalMargin.miniMargin;
  double mainAxisSpacing = EternalMargin.miniMargin;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(EternalPadding.miniPadding),
      child: CustomScrollView(
        slivers: [
          SliverWaterfallFlow(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return SizedBox(
                child: InkWell(
                  onTap: () {
                    EternalNavigatorRoute.push(context, HomeDetails());
                  },
                  child: HomeRecommendCardBody(),
                ),
              );
            }, childCount: 50),
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              collectGarbage: (List<int> garbages) {
                // print('collect garbage : $garbages');
              },
              viewportBuilder: (int firstIndex, int lastIndex) {
                // print('viewport : [$firstIndex,$lastIndex]');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeRecommendCardBody extends StatefulWidget {
  const HomeRecommendCardBody({super.key});

  @override
  State<HomeRecommendCardBody> createState() => _HomeRecommendCardBodyState();
}

class _HomeRecommendCardBodyState extends State<HomeRecommendCardBody> {
  String title = "治愈系画风丨原始探险荒野森林场景插画丨画风增强";
  Color _favoriteColor = Colors.white;
  String image = EternalConstants.getImage();
  int ratio = Random().nextInt(16);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: constraints.maxWidth * ((ratio < 3 ? 3 : ratio) / (ratio < 4 ? 4 : ratio)),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
              ),
              alignment: Alignment.topRight,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return HomeCategorySimpleDetails();
                        });
                  },
                  icon: const Icon(
                    Icons.more_horiz,
                    shadows: [
                      BoxShadow(color: Colors.black38, offset: Offset(0.0, 1.0), blurRadius: 0.5, spreadRadius: 1.0)
                    ],
                  ),
                  splashRadius: 20,
                  splashColor: Colors.black26,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(EternalPadding.miniPadding),
              color: EternalColors.boxDefaultColor,
              child: Column(
                children: [
                  Text(
                    style: const TextStyle(fontWeight: FontWeight.bold, color: EternalColors.titleColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    title,
                  ),
                  SizedBox(height: EternalMargin.smallMargin),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          EternalNavigatorRoute.push(context, HomeDetailsTwo());
                        },
                        child: Wrap(
                          spacing: EternalMargin.miniMargin,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ///头像 昵称
                            CircleAvatar(backgroundImage: NetworkImage(EternalConstants.getImage()), radius: 10),
                            Text("ETERNAL", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      AnimatedSwitcher(
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, anim) {
                          return ScaleTransition(scale: anim, child: child);
                        },
                        duration: const Duration(milliseconds: 200),
                        child: InkWell(
                          key: ValueKey(_favoriteColor),
                          child: Wrap(
                            spacing: EternalMargin.miniMargin,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.favorite_rounded, size: 20, color: _favoriteColor),
                              Text("${Random().nextInt(999)}")
                            ],
                          ),
                          onTap: () {
                            // print("喜欢");
                            setState(() {
                              _favoriteColor == Colors.white ? _favoriteColor = Colors.red : _favoriteColor = Colors.white;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
