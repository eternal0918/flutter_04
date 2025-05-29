import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

class PersonCollectEdit extends StatefulWidget {
  const PersonCollectEdit({Key? key}) : super(key: key);

  @override
  _PersonCollectEditState createState() => _PersonCollectEditState();
}

class _PersonCollectEditState extends State<PersonCollectEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: EternalColors.defaultColor,
        title: Text("修改收藏夹"),
        actions: [
          TextButton(onPressed: () {}, child: Text("确认修改", style: TextStyle(color: Colors.orangeAccent))),
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
                    label: Text("修改封面"),
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
