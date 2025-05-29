import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/components/eternal_mode_sheet.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/login/login_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeDrawerPage();
  }
}

class HomeDrawerPage extends StatefulWidget {
  const HomeDrawerPage({super.key});

  @override
  State<HomeDrawerPage> createState() => _HomeDrawerPageState();
}

class _HomeDrawerPageState extends State<HomeDrawerPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.zero, right: Radius.circular(20)),
          color: EternalColors.defaultColor,
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(EternalConstants.imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.grey.shade900.withOpacity(0.7), BlendMode.srcOver),
                ),
              ),
              child: const HomeDrawerHeader(),
            ),
            const Text("你好"),
            Container(
              padding: EdgeInsets.all(EternalMargin.smallMargin),
              child: ElevatedButton(
                onPressed: () {
                  final modalRoute = ModalSheetRoute(
                    transitionDuration: const Duration(milliseconds: 400),
                    builder: (context) => const LogOutSheet(),
                  );
                  Navigator.push(context, modalRoute);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(100, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: EternalColors.boxDefaultColor,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("退出登录"),
                    Icon(Icons.exit_to_app),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LogOutSheet extends StatefulWidget {
  const LogOutSheet({super.key});

  @override
  State<LogOutSheet> createState() => _LogOutSheetState();
}

class _LogOutSheetState extends State<LogOutSheet> {
  @override
  Widget build(BuildContext context) {
    return EternalModeSheet(
      content: Column(
        children: [
          TextButton(
            onPressed: () {
              //跳转到登录界面
              EternalNavigatorRoute.pushAndRemoveUntil(context, const LoginPage());
            },
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: EternalMargin.defaultMargin,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                children: [
                  const Icon(LucideIcons.swatchBook),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("切换账号", style: TextStyle(fontSize: EternalFontSize.medium())),
                      SizedBox(height: EternalMargin.miniMargin),
                      Text(
                        "退出当前登录的账号，跳转登录页面",
                        style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: EternalMargin.smallMargin),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: EternalMargin.defaultMargin,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                children: [
                  const Icon(Icons.close),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("退出应用", style: TextStyle(fontSize: EternalFontSize.medium())),
                      SizedBox(height: EternalMargin.miniMargin),
                      Text(
                        "彻底关闭应用，不会停留在后台",
                        style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: EternalMargin.smallMargin),
        ],
      ),
    );

    //
    //   SheetDismissible(
    //   child: DraggableSheet(
    //     child: BackdropFilter(
    //       filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Container(
    //             padding: EdgeInsets.only(
    //               left: EternalPadding.defaultPadding,
    //               right: EternalPadding.defaultPadding,
    //               bottom: EternalPadding.smallPadding,
    //             ),
    //             margin: EdgeInsets.symmetric(horizontal: EternalMargin.smallMargin),
    //             width: MediaQuery.of(context).size.width,
    //             clipBehavior: Clip.hardEdge,
    //
    //             ///设置 连续圆角形状
    //             decoration: ShapeDecoration(
    //                 color: EternalColors.defaultColor,
    //                 shape: ContinuousRectangleBorder(
    //                   borderRadius: BorderRadius.circular(50),
    //                 )),
    //             child: Column(
    //               children: [
    //                 const EternalSheetSlip(),
    //                 TextButton(
    //                   onPressed: () {
    //                     //跳转到登录界面
    //                     EternalNavigatorRoute.pushAndRemoveUntil(context, const LoginPage());
    //                   },
    //                   style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    //                   child: SizedBox(
    //                     width: double.infinity,
    //                     child: Wrap(
    //                       spacing: EternalMargin.defaultMargin,
    //                       crossAxisAlignment: WrapCrossAlignment.center,
    //                       alignment: WrapAlignment.start,
    //                       children: [
    //                         const Icon(LucideIcons.swatchBook),
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text("切换账号", style: TextStyle(fontSize: EternalFontSize.medium())),
    //                             SizedBox(height: EternalMargin.miniMargin),
    //                             Text(
    //                               "退出当前登录的账号，跳转登录页面",
    //                               style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor),
    //                             ),
    //                           ],
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(height: EternalMargin.smallMargin),
    //                 TextButton(
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                   style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    //                   child: SizedBox(
    //                     width: double.infinity,
    //                     child: Wrap(
    //                       spacing: EternalMargin.defaultMargin,
    //                       crossAxisAlignment: WrapCrossAlignment.center,
    //                       alignment: WrapAlignment.start,
    //                       children: [
    //                         const Icon(Icons.close),
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text("退出应用", style: TextStyle(fontSize: EternalFontSize.medium())),
    //                             SizedBox(height: EternalMargin.miniMargin),
    //                             Text(
    //                               "彻底关闭应用，不会停留在后台",
    //                               style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor),
    //                             ),
    //                           ],
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(height: EternalMargin.smallMargin),
    //
    //                 ///根据父级宽度计算
    //                 // FractionallySizedBox(
    //                 //   widthFactor: 0.5,
    //                 //   child: ElevatedButton(
    //                 //     onPressed: () {},
    //                 //     style: ElevatedButton.styleFrom(
    //                 //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //                 //       foregroundColor: Colors.white,
    //                 //       backgroundColor: EternalColors.getPrimaryColor(),
    //                 //     ),
    //                 //     child: const Row(
    //                 //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 //       children: [Icon(Icons.exit_to_app), Text("确认")],
    //                 //     ),
    //                 //   ),
    //                 // )
    //               ],
    //             ),
    //           ),
    //           SizedBox(height: EternalMargin.smallMargin),
    //
    //           ///取消弹窗
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             style: ElevatedButton.styleFrom(shape: const StadiumBorder(), minimumSize: const Size(180, 40)),
    //             child: const Text("取消"),
    //           ),
    //           SizedBox(height: EternalPadding.smallPadding),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class HomeDrawerHeader extends StatefulWidget {
  const HomeDrawerHeader({super.key});

  @override
  State<HomeDrawerHeader> createState() => _HomeDrawerHeaderState();
}

class _HomeDrawerHeaderState extends State<HomeDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: EternalPadding.smallPadding,
        top: 0,
        right: EternalPadding.smallPadding,
        bottom: EternalPadding.smallPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //状态栏高度
          SizedBox(height: EternalConstants.statusBarHeight),
          //头像
          Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              image: DecorationImage(image: NetworkImage(EternalConstants.imageUrl), fit: BoxFit.fill),
            ),
          ),
          TextButton.icon(icon: Icon(Icons.person_rounded, size: 15), label: Text("ETERNAL"), onPressed: () {}),
          TextButton.icon(icon: Icon(Icons.phone_android, size: 15), label: Text("18069436491"), onPressed: () {}),
          TextButton.icon(icon: Icon(Icons.email_rounded, size: 15), label: Text("eternal0918@163.com"), onPressed: () {}),
        ],
      ),
    );
    // return BackdropFilter(
    //   filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    //   child:
    // );
  }
}
