import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_04/entity/eternal_entity.dart';
import 'package:flutter_04/notification/home/home_fire_filter_theme_notification.dart';

class HomeFireFilterThemeGrid extends StatefulWidget {
  List<EternalThemeItem> themeList;

  HomeFireFilterThemeGrid({Key? key, required this.themeList}) : super(key: key);

  @override
  _HomeFireFilterThemeGridState createState() => _HomeFireFilterThemeGridState();
}

class _HomeFireFilterThemeGridState extends State<HomeFireFilterThemeGrid> {
  List<int> _selectedIndexList = [0];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.hardEdge,
      child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          children: widget.themeList
              .map((themeItem) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 2.0),
                        image: DecorationImage(
                          image: NetworkImage(themeItem.imageUrl),
                          fit: BoxFit.cover,
                        )),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (_selectedIndexList.contains(themeItem.id)) {
                            _selectedIndexList.remove(themeItem.id);
                          } else {
                            _selectedIndexList.add(themeItem.id);
                          }
                          HomeFireFilterThemeNotification("theme", themeItem, null).dispatch(context);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Visibility(
                              visible: _selectedIndexList.contains(themeItem.id),
                              child: Text("√"),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black54,
                            ),
                            child: Center(child: Text("${themeItem.name}", style: TextStyle(fontSize: 10))),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
