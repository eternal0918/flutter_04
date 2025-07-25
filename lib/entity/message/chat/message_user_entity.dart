import 'dart:ffi';

import 'package:animated_emoji/emoji.dart';
import 'package:flutter/cupertino.dart';

class MessageUserEntity {
  int userId;
  String text;
  DateTime time;
  String avatar;
  String userName;
  int msgCount;

  MessageUserEntity({
    required this.userId,
    required this.text,
    required this.avatar,
    required this.userName,
    required this.time,
    required this.msgCount,
  });
}
