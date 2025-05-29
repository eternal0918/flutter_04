import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

class PersonCollectAdd extends StatefulWidget {
  const PersonCollectAdd({Key? key}) : super(key: key);

  @override
  _PersonCollectAddState createState() => _PersonCollectAddState();
}

class _PersonCollectAddState extends State<PersonCollectAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: EternalColors.defaultColor,
        title: Text("创建收藏夹"),
        actions: [
          TextButton(onPressed: () {}, child: Text("确认创建", style: TextStyle(color: Colors.orangeAccent))),
          SizedBox(width: EternalMargin.smallMargin)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '标题',
                labelStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: EternalMargin.smallMargin),
            const TextField(
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '简介描述',
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: EternalMargin.smallMargin),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add_photo_alternate),
                    label: Text("添加封面"),
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
