import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/notification/release/release_publish_simple_details_notification.dart';
import 'package:flutter_04/pages/release/publish/release_publish_setting.dart';
import 'package:flutter_04/pages/release/publish/release_publish_simple_details.dart';
import 'package:flutter_04/pages/release/publish/release_publish_tag.dart';

class ReleasePublish extends StatefulWidget {
  const ReleasePublish({Key? key}) : super(key: key);

  @override
  _ReleasePublishState createState() => _ReleasePublishState();
}

class _ReleasePublishState extends State<ReleasePublish> {
  ///图片数量
  final int _imageCount = 3;

  ///当前简述详情下标
  int _imageSimpleDetailsIndex = 1;

  ///简述详情高度
  double _simpleDetailsHeight = 300;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ReleasePublishSimpleDetailsNotification>(
      onNotification: (notification) {
        setState(() {
          _simpleDetailsHeight = notification.height;
        });
        return true;
      },
      child: Scaffold(

        backgroundColor: EternalColors.defaultColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: EternalColors.defaultColor,
          title: const Text("发布动态"),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            splashRadius: 20,
          ),
          actions: [
            SizedBox(
              height: 40,
              child: Wrap(
                spacing: EternalMargin.smallMargin,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo_library_outlined,
                      size: EternalIconSize.smallSize,
                      color: EternalColors.titleColor,
                    ),
                    label: const Text("添加", style: TextStyle(color: EternalColors.titleColor)),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(side: BorderSide(color: EternalColors.getSuccessColor())),
                    icon: Icon(
                      Icons.send_time_extension_outlined,
                      size: EternalIconSize.smallSize,
                      color: EternalColors.getSuccessColor(),
                    ),
                    label: Text("发布", style: TextStyle(color: EternalColors.getSuccessColor())),
                  ),
                  SizedBox(width: EternalMargin.miniMargin)
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '标题',
                    labelStyle: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '用一段话来描述你的作品吧...',
                    hintStyle: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: EternalMargin.defaultMargin)),

              // const SliverToBoxAdapter(child: Text("标签")),
              // SliverToBoxAdapter(child: SizedBox(height: EternalMargin.smallMargin)),

              ///标签
              const SliverToBoxAdapter(child: ReleasePublishTag()),
              SliverToBoxAdapter(child: SizedBox(height: EternalMargin.defaultMargin)),

              ///图片
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                  clipBehavior: Clip.hardEdge,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    crossAxisCount: 3,
                    crossAxisSpacing: EternalMargin.groupMargin,
                    mainAxisSpacing: EternalMargin.groupMargin,
                    children: List.generate(
                      _imageCount,
                      (index) => Image(image: NetworkImage(EternalConstants.getImage()), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),

              //作品参数
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text("$_imageSimpleDetailsIndex / $_imageCount"),
                      labelPadding: const EdgeInsets.symmetric(vertical: -5),
                      padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
                      backgroundColor: Colors.black54,
                    ),
                    AnimatedContainer(
                      height: _simpleDetailsHeight,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCirc,
                      child: PageView(
                        onPageChanged: (index) {
                          setState(() {
                            _imageSimpleDetailsIndex = index + 1;
                          });
                        },
                        physics: const BouncingScrollPhysics(),
                        children: List.generate(_imageCount, (index) => const ReleasePublishSimpleDetails()),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const ReleasePublishSetting(),
      ),
    );
  }
}
