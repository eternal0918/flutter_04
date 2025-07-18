import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/home_details.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';
import 'package:flutter_04/pages/message/more/message_more_setting.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import '../../../constants/eternal_constants.dart';
import '../../../constants/eternal_font_size.dart';
import '../../../constants/eternal_margin.dart';

class MessageMoreLeft extends StatefulWidget {
  const MessageMoreLeft({super.key});

  @override
  State<MessageMoreLeft> createState() => _MessageMoreLeftState();
}

class _MessageMoreLeftState extends State<MessageMoreLeft> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: false,
        colorScheme: const ColorScheme.light()..copyWith(primary: Colors.black, secondary: Colors.black),
        // fontFamily: 'HYZhengYuan',
      ),
      child: Material(
        color: Colors.transparent,
        child: ScrollableSheet(
          physics: const StretchingSheetPhysics(parent: SnappingSheetPhysics()),
          minExtent: const Extent.proportional(0.5),
          initialExtent: const Extent.proportional(0.5),
          maxExtent: const Extent.proportional(0.9),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Container(
              //设置底部距离，避免按钮在最下面未显示
              margin: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height * 0.1 + EternalMargin.normalMargin),
              padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: ShapeDecoration(
                        color: EternalColors.boxWhiteColor,
                        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Column(
                        children: [
                          // EternalSheetSlip(bgColor: EternalColors.sheetWhiteSlip),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () => EternalNavigatorRoute.push(context, MessageMoreSetting()),
                                  icon: Icon(LucideIcons.settings, color: EternalColors.sheetWhiteSlip, size: EternalIconSize.defaultSize),
                                ),
                                IconButton(
                                  onPressed: () => EternalNavigatorRoute.pop(context),
                                  icon: const Icon(Icons.cancel, color: EternalColors.sheetWhiteSlip),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    // 获取父元素的宽度
                                    double parentWidth = constraints.maxWidth;
                                    return CustomScrollView(
                                      slivers: [
                                        ///用户信息
                                        SliverToBoxAdapter(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/512/512'), radius: 40),
                                              SizedBox(height: EternalMargin.normalMargin),
                                              Wrap(
                                                spacing: EternalMargin.smallMargin,
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                children: [
                                                  Text('John Doe', style: TextStyle(fontSize: EternalFontSize.large(), fontWeight: FontWeight.bold)),
                                                  Wrap(
                                                    spacing: EternalMargin.miniMargin,
                                                    crossAxisAlignment: WrapCrossAlignment.center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(50),
                                                        child: Container(width: 10, height: 10, color: Colors.green),
                                                      ),
                                                      Text('在线', style: TextStyle(fontSize: EternalFontSize.regular()))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: EternalMargin.smallMargin),
                                              SizedBox(
                                                width: 250,
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(fontSize: EternalFontSize.base(), color: Colors.black),
                                                    children: [
                                                      WidgetSpan(
                                                          alignment: PlaceholderAlignment.middle, child: SizedBox(width: EternalFontSize.base() * 2)),
                                                      TextSpan(text: '京口瓜洲一水间，钟山只隔数重山。春风又绿江南岸，明月何时照我还。'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: EternalMargin.miniMargin),
                                              Wrap(
                                                children: [
                                                  TextButton.icon(
                                                    onPressed: () {},
                                                    icon: Icon(Icons.location_on_outlined, size: EternalIconSize.smallSize),
                                                    style: TextButton.styleFrom(
                                                      minimumSize: const Size(180, 40),
                                                      foregroundColor: Colors.black,
                                                      textStyle: TextStyle(fontSize: EternalFontSize.base()),
                                                    ),
                                                    label: const Text("浙江，杭州"),
                                                  ),
                                                  TextButton.icon(
                                                    onPressed: () {},
                                                    icon: Icon(Icons.contact_phone_outlined, size: EternalIconSize.smallSize),
                                                    style: TextButton.styleFrom(
                                                      minimumSize: const Size(180, 40),
                                                      foregroundColor: Colors.black,
                                                      textStyle: TextStyle(fontSize: EternalFontSize.base()),
                                                    ),
                                                    label: Text("${Random().nextInt(999999999)}"),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: EternalMargin.miniMargin),
                                              Wrap(
                                                spacing: EternalMargin.normalMargin,
                                                children: [
                                                  ElevatedButton.icon(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      shape: const StadiumBorder(),
                                                      backgroundColor: Colors.black,
                                                      padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                                                    ),
                                                    icon: Icon(Icons.phone_in_talk_outlined, size: EternalIconSize.smallSize),
                                                    label: Text("语音", style: TextStyle(color: Colors.white, fontSize: EternalFontSize.regular())),
                                                  ),
                                                  ElevatedButton.icon(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      shape: const StadiumBorder(),
                                                      backgroundColor: Colors.black,
                                                      padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                                                    ),
                                                    icon: Icon(Icons.video_call, size: EternalIconSize.smallSize),
                                                    label: Text("视频", style: TextStyle(color: Colors.white, fontSize: EternalFontSize.regular())),
                                                  ),
                                                  ElevatedButton.icon(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      shape: const StadiumBorder(),
                                                      backgroundColor: EternalColors.cancelColor,
                                                      padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                                                    ),
                                                    icon: Icon(Icons.search, size: EternalIconSize.defaultSize, color: Colors.black),
                                                    label: Text("搜索", style: TextStyle(color: Colors.black, fontSize: EternalFontSize.regular())),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SliverToBoxAdapter(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: EternalMargin.defaultMargin),
                                            height: 1,
                                            color: EternalColors.secondBoxWhiteColor,
                                          ),
                                        ),

                                        ///勋章级别
                                        SliverToBoxAdapter(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(LucideIcons.medal, size: EternalIconSize.defaultSize),
                                                  SizedBox(width: EternalMargin.miniMargin),
                                                  Text("勋章", style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.medium())),
                                                ],
                                              ),
                                              SizedBox(height: EternalMargin.normalMargin),
                                              LayoutBuilder(
                                                builder: (context, constraints) {
                                                  return Stack(
                                                    children: [
                                                      Container(height: 150),
                                                      Positioned(
                                                        left: 60,
                                                        child: Container(
                                                          height: 150,
                                                          clipBehavior: Clip.hardEdge,
                                                          decoration: ShapeDecoration(
                                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                height: 110,
                                                                width: constraints.maxWidth - 60,
                                                                padding: const EdgeInsets.only(left: 60, top: 10),
                                                                decoration: const BoxDecoration(
                                                                  // 渐变
                                                                  gradient: LinearGradient(
                                                                    begin: Alignment.bottomLeft,
                                                                    end: Alignment.topRight,
                                                                    colors: [Color.fromRGBO(248, 153, 94, 1), Color.fromRGBO(254, 123, 119, 1)],
                                                                  ),
                                                                ),
                                                                child: Wrap(
                                                                  direction: Axis.vertical,
                                                                  // spacing: EternalMargin.normalMargin,
                                                                  children: [
                                                                    RichText(
                                                                      text: TextSpan(
                                                                        style: TextStyle(
                                                                          fontSize: EternalFontSize.extraLarge(),
                                                                          letterSpacing: 0,
                                                                          fontWeight: FontWeight.bold,
                                                                          fontStyle: FontStyle.italic,
                                                                          color: EternalColors.titleColor,
                                                                        ),
                                                                        children: const [TextSpan(text: "Lv"), TextSpan(text: " 5")],
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "获取时间：2025年7月11日",
                                                                      style: TextStyle(fontSize: EternalFontSize.small(), color: Colors.white70),
                                                                    ),
                                                                    SizedBox(height: EternalMargin.smallMargin),
                                                                    SizedBox(
                                                                      width: 200,
                                                                      child: ClipRRect(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        child: const LinearProgressIndicator(
                                                                          value: 0.3,
                                                                          backgroundColor: Colors.white60,
                                                                          color: Colors.yellow,
                                                                          minHeight: 5,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: EternalMargin.smallMargin),
                                                                    Text(
                                                                      "13500 XP",
                                                                      style: TextStyle(
                                                                        fontFamily: "videopac",
                                                                        fontSize: EternalFontSize.regular(),
                                                                        color: Colors.white70,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 40,
                                                                width: constraints.maxWidth - 60,
                                                                decoration: const BoxDecoration(
                                                                  // 渐变
                                                                  gradient: LinearGradient(
                                                                    begin: Alignment.bottomLeft,
                                                                    end: Alignment.topRight,
                                                                    colors: [Color.fromRGBO(197, 2, 63, 1), Color.fromRGBO(97, 40, 181, 1)],
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [
                                                                    Text(
                                                                      "了解更多",
                                                                      style: TextStyle(color: Colors.white, fontSize: EternalFontSize.base()),
                                                                    ),
                                                                    Icon(Icons.more_horiz, size: EternalIconSize.defaultSize, color: Colors.white),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(top: 25, child: Image.asset('assets/images/level/level_5.png', height: 110)),
                                                    ],
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        SliverToBoxAdapter(child: SizedBox(height: EternalMargin.smallMargin)),

                                        ///动态
                                        SliverToBoxAdapter(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(LucideIcons.pawPrint, size: EternalIconSize.defaultSize),
                                                      SizedBox(width: EternalMargin.miniMargin),
                                                      Text("动态", style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.medium())),
                                                    ],
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        EternalNavigatorRoute.push(context, const HomeDetailsTwo());
                                                      },
                                                      style: TextButton.styleFrom(
                                                        foregroundColor: Colors.black,
                                                        shape: const StadiumBorder(),
                                                      ),
                                                      child: Wrap(
                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                        children: [
                                                          Text("更多", style: TextStyle(fontSize: EternalFontSize.base())),
                                                          Icon(Icons.chevron_right, size: EternalIconSize.smallSize),
                                                        ],
                                                      ))
                                                ],
                                              ),
                                              SizedBox(height: EternalMargin.miniMargin),
                                              Container(
                                                height: 180,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: ShapeDecoration(
                                                  shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                ),
                                                child: ListView.separated(
                                                  physics: const BouncingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  addAutomaticKeepAlives: false,
                                                  addRepaintBoundaries: false,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    ///图片
                                                    return Stack(
                                                      children: [
                                                        Container(
                                                          clipBehavior: Clip.hardEdge,
                                                          decoration: ShapeDecoration(
                                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                          ),
                                                          child: CachedNetworkImage(
                                                            imageUrl: EternalConstants.getImage(),
                                                            height: 180,
                                                            width: 180 / 4 * 3,
                                                            fit: BoxFit.cover,
                                                            placeholder: (context, url) => const LinearProgressIndicator(
                                                              color: Colors.black,
                                                            ),
                                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 180,
                                                          width: 180 / 4 * 3,
                                                          clipBehavior: Clip.hardEdge,
                                                          decoration: ShapeDecoration(
                                                            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                            // 渐变遮罩
                                                            gradient: LinearGradient(
                                                              begin: Alignment.topCenter,
                                                              end: Alignment.bottomCenter,
                                                              colors: [
                                                                Colors.black.withOpacity(0.0), // 顶部透明
                                                                Colors.black.withOpacity(0.0), // 顶部透明
                                                                Colors.black.withOpacity(0.0), // 顶部透明
                                                                Colors.black.withOpacity(0.0), // 顶部透明
                                                                Colors.black.withOpacity(0.3), // 顶部透明
                                                                Colors.black.withOpacity(0.5), // 顶部透明
                                                                Colors.black.withOpacity(0.7), // 底部黑色
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            width: 180 / 4 * 3,
                                                            padding: EdgeInsets.all(EternalPadding.smallPadding),
                                                            child: Text(
                                                              "A Material carousel widget that presents a scrollable list of items",
                                                              style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.titleColor),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                  separatorBuilder: (BuildContext context, int index) {
                                                    return SizedBox(width: EternalMargin.normalMargin);
                                                  },
                                                  itemCount: 20,
                                                ),
                                              ),
                                              SizedBox(height: EternalMargin.miniMargin),
                                            ],
                                          ),
                                        ),

                                        ///TA的创作
                                        SliverToBoxAdapter(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(LucideIcons.sparkles, size: EternalIconSize.defaultSize),
                                                      SizedBox(width: EternalMargin.miniMargin),
                                                      Text(
                                                        "TA的创作",
                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.medium()),
                                                      ),
                                                    ],
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        // EternalNavigatorRoute.push(context, const HomeDetailsTwo());
                                                      },
                                                      style: TextButton.styleFrom(
                                                        foregroundColor: Colors.black,
                                                        shape: const StadiumBorder(),
                                                      ),
                                                      child: Wrap(
                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                        children: [
                                                          Text("更多", style: TextStyle(fontSize: EternalFontSize.base())),
                                                          Icon(Icons.chevron_right, size: EternalIconSize.smallSize),
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SliverToBoxAdapter(child: SizedBox(height: EternalMargin.miniMargin)),

                                        ///图片列表
                                        SliverGrid(
                                          delegate: SliverChildBuilderDelegate(
                                            (context, index) {
                                              return Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                                child: CachedNetworkImage(
                                                  imageUrl: EternalConstants.getImage(),
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) => const LinearProgressIndicator(
                                                    color: Colors.black,
                                                  ),
                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                ),
                                              );
                                            },
                                            childCount: 50,
                                          ),
                                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: parentWidth / 2 - 10,
                                              childAspectRatio: 3 / 4,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10),
                                        ),
                                        SliverToBoxAdapter(child: SizedBox(height: EternalMargin.normalMargin))
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: EternalMargin.miniMargin),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      minimumSize: const Size(180, 40),
                      backgroundColor: EternalColors.secondBoxWhiteColor,
                    ),
                    child: const Text("取消", style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
