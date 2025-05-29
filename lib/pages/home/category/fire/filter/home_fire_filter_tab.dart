import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/entity/eternal_entity.dart';

class HomeFireFilterTab extends StatefulWidget {
  List<EternalTabItem> tabList;
  String title;

  HomeFireFilterTab({Key? key, required this.tabList, required this.title}) : super(key: key);

  @override
  _HomeFireFilterTabState createState() => _HomeFireFilterTabState();
}

class _HomeFireFilterTabState extends State<HomeFireFilterTab> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(width: 3, color: EternalColors.getPrimaryColor())),
            ),
            child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
        ),
        Expanded(
          flex: 6,
          child: Wrap(
            spacing: EternalMargin.miniMargin,
            runSpacing: EternalMargin.miniMargin,
            children: widget.tabList
                .map((tabItem) => SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        child: Text(tabItem.name,
                            style: TextStyle(
                              color: _tabIndex == tabItem.value ? Colors.white : EternalColors.secondTextColor,
                            )),
                        onPressed: () {
                          setState(() {
                            _tabIndex = tabItem.value;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor:
                              _tabIndex == tabItem.value ? EternalColors.getPrimaryColor() : EternalColors.boxDefaultColor,
                          elevation: 0,
                        ),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
