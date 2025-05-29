import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/pages/message/chat/message_chat.dart';

import '../../base/eternal_navigator_route.dart';
import '../../constants/eternal_colors.dart';
import '../../constants/eternal_constants.dart';
import '../../constants/eternal_margin.dart';
import '../../constants/eternal_padding.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageScrollView();
  }
}

class MessageScrollView extends StatefulWidget {
  const MessageScrollView({super.key});

  @override
  State<MessageScrollView> createState() => _MessageScrollViewState();
}

class _MessageScrollViewState extends State<MessageScrollView> {
  late ScrollController _controller;
  int _count = 10;
  bool _isLoding = false;
  bool _isRefreshing = false;
  String loadingText = "加载中.....";

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,

      ///头部设置
      appBar: AppBar(
        elevation: 0,
        backgroundColor: EternalColors.defaultColor,
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text("消息"),
            const SizedBox(width: 10),
            SizedBox(
              height: 25,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.motion_photos_off, color: EternalColors.textColor, size: EternalIconSize.miniSize),
                label: const Text("清除未读", style: TextStyle(fontSize: 10, color: EternalColors.textColor)),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: EternalColors.boxDefaultColor, // 设置按钮背景颜色
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Icon(Icons.search_rounded, size: EternalIconSize.defaultSize),
          ),
          const SizedBox(width: 10),
        ],
      ),

      ///头部伸缩 设置
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: EternalColors.defaultColor,
            elevation: 0,
            expandedHeight: 130,
            collapsedHeight: 80,
            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(10),
            //   child: Row(
            //     children: [FlutterLogo()],
            //   ),
            // ),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.3,
              titlePadding: EdgeInsets.only(bottom: EternalPadding.smallPadding),
              title: SizedBox(
                height: 70,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
                  itemBuilder: (BuildContext context, int index) {
                    int fireTemperature = Random().nextInt(90);
                    int tempColor = ((fireTemperature ~/ 10) + 1) * 100;

                    ///热门作者
                    return Column(
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
                        SizedBox(height: EternalMargin.miniMargin),
                        Text("Eternal", style: TextStyle(fontSize: 10))
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: EternalMargin.smallMargin);
                  },
                  itemCount: 20,
                ),
              ),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.only(top: EternalPadding.smallPadding),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(index.toString()),
                      onDismissed: (directory) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('已移除 Eternal ${index + 1} 会话.')));
                      },
                      background: Container(color: Colors.redAccent, child: const Icon(Icons.remove_circle_outline)),
                      child: InkWell(
                        onTap: () {
                          EternalNavigatorRoute.push(context, MessageChat());
                        },
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.only(left: EternalPadding.defaultPadding + EternalPadding.miniPadding),
                          child: Flex(
                            direction: Axis.horizontal, // 设置布局方向为垂直
                            children: [
                              Container(
                                width: 50,
                                child: Stack(
                                  children: [
                                    Positioned(
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
                                    Positioned(
                                      bottom: 0,
                                      right: 3,
                                      child: Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(color: EternalColors.boxDefaultColor, width: 3)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: EternalMargin.smallMargin),
                              Expanded(
                                flex: 1, // 占据剩余空间的比例
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      padding: EdgeInsets.only(top: EternalPadding.smallPadding, right: EternalPadding.defaultPadding),
                                      child: Flex(direction: Axis.horizontal, children: [
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text("Eternal ${index + 1}", style: TextStyle(fontWeight: FontWeight.bold)),
                                                ),
                                                const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "A Material carousel widget that presents a scrollable list of items, each of which can dynamically change size based on the chosen layout.",
                                                      style: TextStyle(color: EternalColors.secondTextColor, fontSize: 12),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    )),
                                              ],
                                            )),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              EternalConstants.getCurrentTime(),
                                              style: const TextStyle(fontSize: 12, color: EternalColors.secondTextColor),
                                            ),
                                            const Icon(Icons.circle, size: 10, color: Colors.redAccent)
                                          ],
                                        )
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                      width: double.infinity,
                                      child: DecoratedBox(decoration: BoxDecoration(color: EternalColors.boxDefaultColor)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Wrap(
                          //   children: [
                          //     ClipOval(
                          //       child: CachedNetworkImage(
                          //         imageUrl: EternalConstants.getImage(),
                          //         height: 40,
                          //         width: 40,
                          //         fit: BoxFit.cover,
                          //         placeholder: (context, url) =>
                          //             const CircularProgressIndicator(),
                          //         errorWidget: (context, url, error) =>
                          //             const Icon(Icons.error),
                          //       ),
                          //     ),
                          //     Column(
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Container(
                          //               child: Text("xxxxxxxxxxxxxxxxx"),
                          //             )
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           height: 1,
                          //           width: double.infinity,
                          //           child: DecoratedBox(
                          //             decoration:
                          //                 BoxDecoration(color: EternalColors.boxDefaultColor),
                          //           ),
                          //         )
                          //       ],
                          //     )
                          //   ],
                          // ),
                        ),
                      ),
                    );
                  },
                  childCount: 20,
                ),
              )

              // Container(
              //   child: NotificationListener(
              //     onNotification: (notification) {
              //       if (notification is ScrollUpdateNotification &&
              //           notification.depth == 0 &&
              //           !_isLoding &&
              //           !_isRefreshing) {
              //         if (notification.metrics.pixels ==
              //             notification.metrics.maxScrollExtent) {
              //           setState(() {
              //             _isLoding = true;
              //             loadingText = "加载中.....";
              //             _count += 10;
              //           });
              //           _RrefreshPull().then((value) {
              //             print('加载成功.............');
              //             setState(() {
              //               _isLoding = false;
              //             });
              //           }).catchError((error) {
              //             print('failed');
              //             setState(() {
              //               _isLoding = true;
              //               loadingText = "加载失败.....";
              //             });
              //           });
              //         }
              //       }
              //       return _isLoding;
              //     },
              //     child: RefreshIndicator(
              //       onRefresh: () {
              //         if (_isLoding) ;
              //         return _RrefreshPull().then((value) {
              //           print('success');
              //           setState(() {
              //             _count += 10;
              //           });
              //         }).catchError((error) {
              //           print('failed');
              //         });
              //       },
              //       child: CustomScrollView(
              //         slivers: [
              //           SliverGrid(
              //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //               mainAxisSpacing: 10.0,
              //               crossAxisSpacing: 10.0,
              //               childAspectRatio: 4.0,
              //               crossAxisCount: 2,
              //             ),
              //             delegate: SliverChildBuilderDelegate(
              //               (BuildContext context, int index) {
              //                 return Container(
              //                   alignment: Alignment.center,
              //                   color: Colors.teal[100 * (index % 9)],
              //                   child: Text('SliverGrid item $index'),
              //                 );
              //               },
              //               childCount: _count,
              //             ),
              //           ),
              //           SliverToBoxAdapter(
              //             child: new Visibility(
              //               child: new Container(
              //                 padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              //                 child: new Center(
              //                   child: new Text(loadingText),
              //                 ),
              //               ),
              //               visible: _isLoding,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              )
        ],
      ),
    );
  }

  Future<String> _RrefreshPull() async {
    await Future.delayed(new Duration(seconds: 3));
    return "_RrefreshPull";
  }
}
