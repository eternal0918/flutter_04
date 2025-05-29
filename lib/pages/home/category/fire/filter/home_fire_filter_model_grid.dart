import 'package:flutter/material.dart';
import 'package:flutter_04/entity/eternal_entity.dart';
import 'package:flutter_04/notification/home/home_fire_filter_theme_notification.dart';

class HomeFireFilterModelGrid extends StatefulWidget {
  List<EternalModelItem> modelList;

  HomeFireFilterModelGrid({Key? key, required this.modelList}) : super(key: key);

  @override
  _HomeFireFilterModelGridState createState() => _HomeFireFilterModelGridState();
}

class _HomeFireFilterModelGridState extends State<HomeFireFilterModelGrid> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.hardEdge,
      child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          children: widget.modelList
              .map((modelItem) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 2.0),
                        image: DecorationImage(
                          image: NetworkImage(modelItem.imageUrl),
                          fit: BoxFit.cover,
                        )),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = modelItem.id;
                          HomeFireFilterThemeNotification("model", null, modelItem).dispatch(context);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Visibility(
                              visible: _selectedIndex == modelItem.id,
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
                            child: Center(child: Text("墨幽${modelItem.id}", style: TextStyle(fontSize: 10))),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
