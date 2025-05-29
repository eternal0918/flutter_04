import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/constants/eternal_shadow.dart';

class HomeDetailsFirePlate extends StatefulWidget {
  int index;

  HomeDetailsFirePlate({Key? key, required this.index}) : super(key: key);

  @override
  _HomeDetailsFirePlateState createState() => _HomeDetailsFirePlateState();
}

class _HomeDetailsFirePlateState extends State<HomeDetailsFirePlate> {
  String title = "治愈系画风丨原始探险荒野森林场景插画丨画风增强治愈系画风丨原始探险荒野森林场景插画丨画风增强";
  String contentText =
      "项目协同提供敏捷、瀑布、任务协同等多种项目模板，降低上手配置难度可通过甘特图、Kanban、 Scrum 等方式管理项目进度，全局掌控和风险控制一目了然通过自动化设置，减少重复性操作，进一步释放人力至业务开发";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: EternalMargin.smallMargin),
      padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding, vertical: EternalPadding.smallPadding),
      decoration: BoxDecoration(
        color: EternalColors.boxDefaultColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: EternalColors.unSelectColor, width: 0.2),
        boxShadow: EternalShadow.cardShadow,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.index == 0 ? TopWidget(constraints) : const Offstage(offstage: true, child: Text("")),
              Column(
                children: [
                  ///头像、昵称、发表时间 部分
                  SizedBox(
                    width: constraints.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          spacing: EternalMargin.smallMargin,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            CircleAvatar(backgroundImage: NetworkImage(EternalConstants.getImage()), radius: 20),
                            Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text("ETERNAL", style: TextStyle(color: EternalColors.titleColor)),
                                Text(
                                  EternalConstants.getCurrentTime(),
                                  style: TextStyle(fontSize: 12, color: EternalColors.secondTextColor),
                                ),
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {},
                          child: Icon(Icons.more_horiz_rounded, size: EternalIconSize.defaultSize),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: EternalMargin.defaultMargin),

                  ///文本 部分
                  SizedBox(
                    width: constraints.maxWidth,
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: EternalColors.titleColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: EternalMargin.miniMargin),
                        Text(
                          contentText,
                          style: const TextStyle(fontSize: 12, color: EternalColors.textColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: EternalMargin.smallMargin),

                  ///图片 部分
                  Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                    clipBehavior: Clip.hardEdge,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      crossAxisSpacing: EternalMargin.groupMargin,
                      mainAxisSpacing: EternalMargin.groupMargin,
                      children: List.generate(
                          9, (index) => Image(image: NetworkImage(EternalConstants.getImage()), fit: BoxFit.cover)),
                    ),
                  ),

                  SizedBox(height: EternalMargin.smallMargin),

                  ///标签 部分
                  SizedBox(
                    width: constraints.maxWidth,
                    child: Wrap(
                      spacing: EternalMargin.miniMargin,
                      runSpacing: EternalMargin.miniMargin,
                      children: List<InkWell>.generate(
                        3,
                        (index) => InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: EternalPadding.miniPadding,
                              horizontal: EternalPadding.smallPadding,
                            ),
                            decoration: BoxDecoration(
                              color: EternalColors.unSelectColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text("霓虹赛博", style: TextStyle(color: EternalColors.titleColor)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///按钮 部分
                  HomeDetailsFirePlateButton()
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

///内容底部按钮 部分
class HomeDetailsFirePlateButton extends StatefulWidget {
  const HomeDetailsFirePlateButton({super.key});

  @override
  State<HomeDetailsFirePlateButton> createState() => _HomeDetailsFirePlateButtonState();
}

class _HomeDetailsFirePlateButtonState extends State<HomeDetailsFirePlateButton> {
  bool favoriteFlag = false;
  bool starFlag = false;
  int commentCount = Random().nextInt(9999);
  int favoriteCount = Random().nextInt(9999);
  int starCount = Random().nextInt(9999);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///评论
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.chat_outlined, size: EternalIconSize.defaultSize, color: EternalColors.selectColor),
          label: Text(commentCount.toString(), style: TextStyle(color: EternalColors.selectColor)),
        ),

        ///收藏
        AnimatedSwitcher(
          switchInCurve: Curves.easeInOutBack,
          transitionBuilder: (child, anim) {
            return ScaleTransition(scale: anim, child: child);
          },
          duration: Duration(milliseconds: 200),
          child: TextButton.icon(
            key: ValueKey(starFlag),
            onPressed: () {
              setState(() {
                starFlag = !starFlag;
                starCount = Random().nextInt(9999);
              });
            },
            icon: Icon(
              starFlag ? Icons.star_rounded : Icons.star_border_rounded,
              size: EternalIconSize.defaultSize,
              color: starFlag ? Colors.orange : EternalColors.selectColor,
            ),
            label: Text(
              starCount.toString(),
              style: TextStyle(
                color: starFlag ? Colors.orange : EternalColors.selectColor,
              ),
            ),
          ),
        ),

        ///喜欢
        AnimatedSwitcher(
          switchInCurve: Curves.easeInOutBack,
          transitionBuilder: (child, anim) {
            return ScaleTransition(scale: anim, child: child);
          },
          duration: Duration(milliseconds: 200),
          child: TextButton.icon(
            key: ValueKey(favoriteFlag),
            onPressed: () {
              setState(() {
                favoriteFlag = !favoriteFlag;
                favoriteCount = Random().nextInt(9999);
              });
            },
            icon: Icon(
              favoriteFlag ? Icons.favorite : Icons.favorite_outline,
              size: EternalIconSize.defaultSize,
              color: favoriteFlag ? Colors.red : EternalColors.selectColor,
            ),
            label: Text(
              favoriteCount.toString(),
              style: TextStyle(
                color: favoriteFlag ? Colors.red : EternalColors.selectColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///置顶标签
class TopWidget extends StatelessWidget {
  BoxConstraints constraints;

  TopWidget(this.constraints, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: EternalMargin.smallMargin,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: EternalMargin.miniMargin,
          children: [
            Icon(
              Icons.access_time,
              size: EternalIconSize.smallSize,
              color: EternalColors.getPrimaryColor(),
            ),
            Text("置顶", style: TextStyle(color: EternalColors.getPrimaryColor())),
          ],
        ),
        SizedBox(
          width: constraints.maxWidth,
          child: Divider(height: 1.0, color: EternalColors.unSelectColor),
        ),
        SizedBox(
          height: EternalMargin.miniMargin,
        )
      ],
    );
  }
}
