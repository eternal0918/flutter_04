import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/category/fire/filter/home_fire_filter.dart';
import 'package:flutter_04/pages/home/category/fire/home_fire_sliver_grid.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomeFire extends StatefulWidget {
  const HomeFire({Key? key}) : super(key: key);

  @override
  _HomeFireState createState() => _HomeFireState();
}

class _HomeFireState extends State<HomeFire> with SingleTickerProviderStateMixin {
  final int _num = 10;

  //创建动画所需要的 controller
  late AnimationController animationController;

  //曲线动画
  late CurvedAnimation curvedAnimation;

  //动画帧
  late Animation animation;

  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    shape: const StadiumBorder(),
    backgroundColor: EternalColors.boxDefaultColor,
    minimumSize: const Size(50, 35),
    padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
  );

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    //曲线动画
    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOutExpo);
    // cubic-bezier(0, 0.8, 0.34, 1)

    //设置 补间动画
    animation = Tween(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imgs = [
      EternalConstants.getImage(),
      EternalConstants.getImage(),
      EternalConstants.getImage(),
      EternalConstants.getImage(),
    ];

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 410,
          backgroundColor: EternalColors.defaultColor,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 0),
            child: Container(
              color: EternalColors.defaultColor,
              width: double.infinity,
              child: Container(
                color: EternalColors.defaultColor,
                margin: EdgeInsets.only(top: EternalMargin.miniMargin),
                padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      spacing: EternalMargin.smallMargin,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          style: buttonStyle,
                          label: Text("评论", style: TextStyle(color: EternalColors.titleColor, fontSize: EternalFontSize.base())),
                          icon: Icon(Icons.chat_rounded, size: EternalIconSize.miniSize, color: EternalColors.titleColor),
                          onPressed: () {},
                        ),
                        ElevatedButton.icon(
                          style: buttonStyle,
                          label: Text("浏览", style: TextStyle(color: EternalColors.titleColor, fontSize: EternalFontSize.base())),
                          icon: Icon(Icons.play_arrow_rounded, size: EternalIconSize.smallSize, color: EternalColors.titleColor),
                          onPressed: () {},
                        ),
                        ElevatedButton.icon(
                          style: buttonStyle,
                          label: Text("喜欢", style: TextStyle(color: EternalColors.titleColor, fontSize: EternalFontSize.base())),
                          icon: Icon(Icons.favorite_rounded, size: EternalIconSize.miniSize, color: EternalColors.titleColor),
                          onPressed: () {},
                        )
                      ],
                    ),
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(
                        Icons.filter_list_rounded,
                        size: EternalIconSize.defaultSize,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const HomeFireFilter(),
                            transitionAnimationController: animationController,
                            backgroundColor: Colors.transparent,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                            isScrollControlled: true);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Container(
                  height: 250,
                  padding: EdgeInsets.only(top: EternalPadding.smallPadding),
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(imgs[index], fit: BoxFit.cover);
                    },
                    itemCount: imgs.length,
                    pagination: SwiperPagination(),
                    control: SwiperControl(
                      iconPrevious: Icons.chevron_left_rounded,
                      iconNext: Icons.chevron_right_rounded,
                      color: EternalColors.titleColor,
                    ),
                    autoplayDelay: 3000,
                    autoplay: true,
                  ),
                ),
                SizedBox(height: EternalMargin.defaultMargin),

                ///热门创作者
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: EternalPadding.defaultPadding,
                  ),
                  child: Wrap(
                    spacing: EternalMargin.miniMargin,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.whatshot_rounded,
                        size: EternalIconSize.smallSize,
                        color: EternalColors.getPrimaryColor(),
                      ),
                      Text(
                        "热门创作者",
                        style: TextStyle(
                          color: EternalColors.titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: EternalFontSize.regular(),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: EternalMargin.smallMargin),

                ///创作者列表
                SizedBox(
                  height: 48,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    padding: EdgeInsets.symmetric(horizontal: EternalPadding.miniPadding),
                    itemBuilder: (BuildContext context, int index) {
                      int fireTemperature = Random().nextInt(90);
                      int tempColor = ((fireTemperature ~/ 10) + 1) * 100;

                      ///热门作者
                      return CreatorItem(fireTemperature, tempColor);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: EternalMargin.miniMargin);
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
            expandedTitleScale: 1,
            centerTitle: true,
          ),
        ),
        // SliverToBoxAdapter(
        //   child:
        // ),
        SliverPadding(
          padding: EdgeInsets.all(EternalPadding.smallPadding),
          sliver: HomeFireSliverGrid(num: _num),
        )
      ],
    );
  }
}

///热门创作者
class CreatorItem extends StatelessWidget {
  final int _fireTemperature;
  final int _tempColor;

  const CreatorItem(this._fireTemperature, this._tempColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        EternalNavigatorRoute.push(context, const HomeDetailsTwo());
      },
      child: Container(
        padding: EdgeInsets.only(right: EternalPadding.smallPadding),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: EternalColors.boxDefaultColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: EternalColors.defaultColor,
                  border: Border.all(color: EternalColors.defaultColor, width: 4)),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: EternalConstants.getImage(),
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(width: EternalMargin.miniMargin),
            Wrap(
              direction: Axis.vertical,
              spacing: EternalMargin.miniMargin,
              children: [
                Text(
                  "ETERNAL",
                  style: TextStyle(
                    fontSize: EternalFontSize.base(),
                    fontWeight: FontWeight.bold,
                    color: EternalColors.titleColor,
                  ),
                ),
                Wrap(
                  spacing: 2,
                  children: [
                    Icon(
                      Icons.local_fire_department_rounded,
                      size: EternalIconSize.miniSize,
                      color: Colors.orange[_tempColor],
                    ),
                    Text(
                      "$_fireTemperature°C",
                      style: TextStyle(
                        color: Colors.orange[_tempColor],
                        fontSize: EternalFontSize.small(),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
