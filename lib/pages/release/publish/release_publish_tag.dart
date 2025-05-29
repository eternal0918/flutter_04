import 'package:flutter/material.dart';
import 'package:flutter_04/components/eternal_sheet_slip.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

class ReleasePublishTag extends StatefulWidget {
  const ReleasePublishTag({Key? key}) : super(key: key);

  @override
  _ReleasePublishTagState createState() => _ReleasePublishTagState();
}

class _ReleasePublishTagState extends State<ReleasePublishTag> {
  ///标签
  final List<int> _tagList = [];

  @override
  void initState() {
    super.initState();
  }

  ///标签超选提示
  void showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        duration: const Duration(milliseconds: 3000),
        width: 280.0,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        behavior: SnackBarBehavior.floating,
        content: Container(
          padding: EdgeInsets.all(EternalPadding.normalPadding),
          child: const Text("标签最多选三个哦...", style: TextStyle(color: Colors.white, letterSpacing: 0.5)),
        ),
      ),
    );
  }

  void selectTag(state, item) {
    state(() {
      setState(() {
        if (_tagList.contains(item)) {
          _tagList.remove(item);
        } else {
          _tagList.length < 3 ? _tagList.add(item) : showSnack();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: EternalPadding.miniPadding,
        horizontal: EternalPadding.smallPadding,
      ),
      decoration: BoxDecoration(color: EternalColors.boxDefaultColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tagList.isEmpty
              ? const Text(
                  "为你的作品添加几个标签吧...",
                  style: TextStyle(color: EternalColors.textColor),
                )
              : Wrap(
                  spacing: EternalMargin.smallMargin,
                  children: _tagList.asMap().entries.map((item) {
                    int value = item.value;
                    return Chip(
                      onDeleted: () {
                        setState(() {
                          _tagList.removeAt(item.key);
                        });
                      },
                      label: Text(
                        "赛博朋克$value",
                        style: const TextStyle(fontSize: 12, color: EternalColors.textColor),
                      ),
                      deleteIcon: Icon(
                        Icons.cancel,
                        color: EternalColors.secondTextColor,
                        size: EternalIconSize.defaultSize,
                      ),
                      deleteButtonTooltipMessage: "",
                      backgroundColor: EternalColors.defaultColor,
                    );
                  }).toList(),
                ),
          Material(
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: EternalColors.defaultColor,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, state) {
                      return Container(
                        height: 300,
                        // color: Colors.deepPurpleAccent,
                        padding: EdgeInsets.only(
                          left: EternalPadding.smallPadding,
                          right: EternalPadding.smallPadding,
                          bottom: EternalPadding.smallPadding,
                        ),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const EternalSheetSlip(),
                              ListTile(
                                title: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: EternalMargin.smallMargin,
                                  children: [
                                    Icon(
                                      Icons.sell,
                                      size: EternalIconSize.defaultSize,
                                      color: EternalColors.getWarningColor(),
                                    ),
                                    const Text("选择标签", style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              Wrap(
                                children: List.generate(
                                  10,
                                  (i) => InkWell(
                                    onTap: () {
                                      selectTag(state, i);
                                    },
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                      padding: EdgeInsets.only(left: EternalPadding.normalPadding),
                                      clipBehavior: Clip.hardEdge,
                                      child: Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          Text("赛博朋克$i"),
                                          Checkbox(
                                            value: _tagList.contains(i),
                                            onChanged: (value) {
                                              selectTag(state, i);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              icon: Icon(Icons.sell, color: EternalColors.getWarningColor()),
              splashRadius: 20,
            ),
          )
        ],
      ),
    );
  }
}
