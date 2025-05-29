import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeSearchHot extends StatefulWidget {
  HomeSearchHot({Key? key}) : super(key: key);

  @override
  _HomeSearchHotState createState() => _HomeSearchHotState();
}

class _HomeSearchHotState extends State<HomeSearchHot> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.whatshot_rounded,
                  size: EternalIconSize.smallSize,
                  color: EternalColors.getDangerColor(),
                ),
                label: const Text("热门搜索", style: TextStyle(color: EternalColors.titleColor))),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    _isLoading = false;
                  });
                });
              },
              icon: _isLoading
                  ? SpinKitHourGlass(
                      color: EternalColors.secondTextColor,
                      size: EternalIconSize.smallSize,
                    )
                  : Icon(
                      Icons.hourglass_bottom_rounded,
                      size: EternalIconSize.smallSize,
                      color: EternalColors.secondTextColor,
                    ),
              label: const Text("换一换", style: TextStyle(color: EternalColors.secondTextColor)),
            ),
          ],
        ),
        SizedBox(height: EternalMargin.miniMargin),

        ///热门搜索
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: EternalPadding.smallPadding,
              horizontal: EternalPadding.defaultPadding,
            ),
            decoration: BoxDecoration(color: EternalColors.boxDefaultColor, borderRadius: BorderRadius.circular(10)),
            child: Wrap(
              spacing: EternalMargin.smallMargin,
              children: List<Chip>.generate(
                  10,
                  (index) => const Chip(
                        label: Text("关闭三星更新", style: TextStyle(fontSize: 12, color: EternalColors.textColor)),
                        backgroundColor: EternalColors.defaultColor,
                      )),
            ))
      ],
    );
  }
}
