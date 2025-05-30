import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import '../constants/eternal_colors.dart';
import '../constants/eternal_margin.dart';
import '../constants/eternal_padding.dart';
import 'eternal_sheet_slip.dart';

class EternalModeSheet extends StatefulWidget {
  Widget? content;
  bool isShowCancel;
  Color cancelColor;
  bool isBackgroundBlur;

  EternalModeSheet({
    super.key,
    this.content,
    this.isShowCancel = true,
    this.cancelColor = EternalColors.cancelColor,
    this.isBackgroundBlur = true,
  });

  @override
  State<EternalModeSheet> createState() => _EternalModeSheetState();
}

class _EternalModeSheetState extends State<EternalModeSheet> {
  @override
  Widget build(BuildContext context) {
    return SheetDismissible(
      child: DraggableSheet(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: widget.isBackgroundBlur ? 1.5 : 0, sigmaY: widget.isBackgroundBlur ? 1.5 : 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: EternalPadding.defaultPadding,
                  right: EternalPadding.defaultPadding,
                  bottom: EternalPadding.smallPadding,
                ),
                margin: EdgeInsets.symmetric(horizontal: EternalMargin.smallMargin),
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.hardEdge,

                ///设置 连续圆角形状
                decoration: ShapeDecoration(
                  color: EternalColors.defaultColor,
                  shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
                ),
                child: Column(children: [
                  const EternalSheetSlip(),
                  SizedBox(child: widget.content),
                ]),
              ),
              SizedBox(height: EternalMargin.smallMargin),

              ///
              if (widget.isShowCancel) ...{
                ///取消弹窗
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: const Size(180, 40),
                    backgroundColor: widget.cancelColor,
                  ),
                  child: const Text("取消"),
                ),
                SizedBox(height: EternalMargin.smallMargin),
              }
            ],
          ),
        ),
      ),
    );
  }
}
