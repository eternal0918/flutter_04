import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/home/details/one/home_details_header_right.dart';
import 'package:flutter_04/pages/home/details/one/home_details_remark.dart';
import 'package:flutter_04/pages/home/details/two/home_details_two.dart';

import 'home_details_body_page.dart';

//图片详情页
class HomeDetailsOne extends StatefulWidget {
  const HomeDetailsOne({super.key});

  @override
  State<HomeDetailsOne> createState() => _HomeDetailsOneState();
}

class _HomeDetailsOneState extends State<HomeDetailsOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: EternalColors.defaultColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: EternalColors.defaultColor,
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            IconButton(icon: const Icon(Icons.arrow_back), splashRadius: 20, onPressed: () => Navigator.of(context).pop()),
            OpenContainer(
              transitionType: ContainerTransitionType.fade,
              transitionDuration: const Duration(milliseconds: 500),
              openBuilder: (BuildContext context, VoidCallback _) {
                return const HomeDetailsTwo();
              },
              closedElevation: 0.0,
              closedColor: Colors.transparent,
              closedBuilder: (BuildContext context, VoidCallback openContainer) {
                return Wrap(
                  spacing: EternalMargin.smallMargin,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(EternalConstants.imageUrl), radius: 20),
                    Container(
                      padding: EdgeInsets.only(left: EternalPadding.smallPadding),
                      child: Text("ETERNAL", style: TextStyle(fontSize: EternalFontSize.mainLarge())),
                    )
                  ],
                );
              },
            ),
          ],
        ),
        actions: [HomeDetailsHeaderRight()],
      ),
      body: HomeDetailsBodyPage(),
      bottomNavigationBar: HomeDetailsRemark(),
    );
  }
}
