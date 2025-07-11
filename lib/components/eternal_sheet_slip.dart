import 'package:flutter/cupertino.dart';

import '../constants/eternal_colors.dart';

///滑条
class EternalSheetSlip extends StatelessWidget {
  Color bgColor;

  EternalSheetSlip({super.key, this.bgColor = EternalColors.unSelectColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 5,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
