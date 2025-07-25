import 'dart:ffi';

import 'package:animated_emoji/emoji.dart';
import 'package:flutter/cupertino.dart';

class ChatMessageEntity {
  int msgId;
  String text;
  bool isMe;
  DateTime time;
  bool isShowTime;
  bool isExceedTwoMinute;
  String avatar;
  String userName;
  double containerHeight;
  double containerWidth;
  bool isWithdraw;
  bool isShowDynamicEmoji;
  int emojiIndex;
  bool isLike;
  double bgRate;

  ChatMessageEntity({
    required this.msgId,
    required this.text,
    required this.avatar,
    required this.userName,
    required this.time,
    this.isMe = false,
    this.isShowTime = false,
    this.isExceedTwoMinute = false,
    this.containerHeight = 0,
    this.containerWidth = 0,
    this.isWithdraw = false,
    this.isShowDynamicEmoji = false,
    this.emojiIndex = 1,
    this.isLike = false,
    this.bgRate = 1,
  });
}
