import 'package:flutter/cupertino.dart';

import '../constants/eternal_colors.dart';

///滑条
class EternalSheetSlip extends StatelessWidget {
  const EternalSheetSlip({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50,
      height: 5,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: EternalColors.unSelectColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
