import 'package:flutter/material.dart';

import '../constants/eternal_colors.dart';
import '../constants/eternal_margin.dart';
import '../constants/eternal_padding.dart';

class EternalAlertDialog extends StatefulWidget {
  Widget titleIcon;
  String? title;
  Widget? content;
  Function()? cancel;
  Widget? cancelContent;
  Function()? confirm;
  Widget? confirmContent;
  Function()? state;

  EternalAlertDialog({
    super.key,
    required this.titleIcon,
    this.title,
    this.content,
    this.cancel,
    this.cancelContent,
    this.confirm,
    this.confirmContent,
    this.state,
  });

  @override
  State<EternalAlertDialog> createState() => _EternalAlertDialogState(
        titleIcon: titleIcon,
        title: title,
        content: content,
        cancel: cancel,
        cancelContent: cancelContent,
        confirm: confirm,
        confirmContent: confirmContent,
        state: state,
      );
}

class _EternalAlertDialogState extends State<EternalAlertDialog> {
  Widget titleIcon;
  String? title;
  Widget? content;
  Function()? cancel;
  Widget? cancelContent;
  Function()? confirm;
  Widget? confirmContent;
  Function()? state;

  _EternalAlertDialogState({
    required this.titleIcon,
    this.title,
    this.content,
    this.cancel,
    this.cancelContent,
    this.confirm,
    this.confirmContent,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(EternalPadding.miniPadding),
      actionsPadding: EdgeInsets.only(
        left: EternalPadding.smallPadding,
        right: EternalPadding.smallPadding,
        bottom: EternalPadding.miniPadding,
      ),
      title: TextButton.icon(
        onPressed: () {},
        icon: titleIcon,
        label: Text(title!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        style: TextButton.styleFrom(alignment: Alignment.topLeft),
      ),
      content: content,
      backgroundColor: EternalColors.defaultColor,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: cancel,
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  child: cancelContent),
            ),
            SizedBox(
              width: EternalMargin.smallMargin,
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: confirm,
                style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: confirmContent,
              ),
            ),
          ],
        )
      ],
    );
  }
}
