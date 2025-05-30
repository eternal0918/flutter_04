import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/entity/message/chat/chat_message_entity.dart';
import 'package:flutter_04/pages/message/chat/message_chat_bottom_tool_bars.dart';
import 'package:intl/intl.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class MessageChat extends StatefulWidget {
  const MessageChat({super.key});

  @override
  State<MessageChat> createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessageEntity> _messages = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final GlobalKey<MessageChatBottomToolBarsState> _bottomToolsKey = GlobalKey<MessageChatBottomToolBarsState>();
  late AnimationController _listViewAnimationController;


  @override
  void initState() {
    super.initState();

    // 添加监听，didChangeMetrics
    WidgetsBinding.instance.addObserver(this);

    //设置 ListView动画效果
    _listViewAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500), // 设置动画持续时间为 500 毫秒
      vsync: this,
    );
    for (int i = 0; i < 20; i++) {
      int msgId1 = Random().nextInt(pow(2, 20).toInt());
      int msgId2 = Random().nextInt(pow(2, 20).toInt());
      var message1 = ChatMessageEntity(
        msgId: msgId1,
        text: '你好！',
        isMe: false,
        time: DateTime.now().subtract(const Duration(minutes: 5)),
        avatar: 'https://picsum.photos/512/512',
        userName: 'John',
      );
      var message2 = ChatMessageEntity(
        msgId: msgId2,
        text: '你好！最近怎么样？',
        isMe: true,
        time: DateTime.now().subtract(const Duration(minutes: 4)),
        avatar: 'https://picsum.photos/512/412',
        userName: 'Me',
      );

      // 添加一些测试消息
      _messages.addAll([message1, message2]);

      _getContainerSize(message1, true);
      _getContainerSize(message2, true);
    }
    _scrollToBottom();
  }

// 当应用程序的尺寸发生变化时会调用
  @override
  void didChangeMetrics() {
    _scrollToBottom();
  }

//发送消息方法
  void _handleSubmitted(String text) {
    ChatMessageEntity lastMessage = _messages[_messages.length - 1];
    var currentTime = DateTime.now();
    Duration difference = DateTime.now().difference(lastMessage.time);
    setState(() {
      bool isMe = Random().nextBool();
      int msgId = Random().nextInt(pow(2, 20).toInt());
      var message = ChatMessageEntity(
        msgId: msgId,
        text: text,
        isMe: isMe,
        time: currentTime,
        avatar: 'https://picsum.photos/512/${isMe ? 412 : 512}',
        userName: 'Me',
        isExceedTwoMinute: difference.inMinutes >= 1,
      );
      _messages.add(message);
      _getContainerSize(message, true);

      _listKey.currentState?.insertItem(
        _messages.length - 1,
        //确保   AnimationController   的   duration   不为   null  ,可以加 !非空判断
        duration: _listViewAnimationController.duration!,
      ); // 触发动画
    });
    // 修改滚动逻辑，滚动到底部
    _scrollToBottom();
  }



//消息列表滑动到底部
  void _scrollToBottom() {
    // 滑动到指定位置
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        //后面加个具体会出现动画弹跳的感觉
        _scrollController.position.maxScrollExtent + 10,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    });
  }

//获取元素高度
  _getContainerSize(ChatMessageEntity message, bool isInitFlag) {
    if (!isInitFlag) {
      setState(() {
        message.containerHeight = message.containerHeight + (message.isShowTime ? 17 : -17);
        message.containerWidth = message.containerWidth + (message.isShowTime ? 40 : -40);
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _listViewAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EternalColors.defaultColor,
      resizeToAvoidBottomInset: false, //输入法不会顶起页面
      appBar: AppBar(
        elevation: 0,
        backgroundColor: EternalColors.defaultColor,
        leading: IconButton(icon: const Icon(Icons.arrow_back), splashRadius: 20, onPressed: () => Navigator.of(context).pop()),
        title: Row(
          children: [
            const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/512/512'), radius: 20),
            SizedBox(width: EternalMargin.smallMargin),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Doe', style: TextStyle(fontSize: EternalFontSize.medium())),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(50), child: Container(width: 10, height: 10, color: Colors.green)),
                    SizedBox(width: EternalMargin.miniMargin),
                    Text('在线', style: TextStyle(fontSize: EternalFontSize.base()))
                  ],
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.segment), splashRadius: 20, onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // 触摸收起键盘
                    FocusScope.of(context).requestFocus(FocusNode());
                    _bottomToolsKey.currentState?.closeBottomTools();
                  },
                  child: AnimatedList(
                    key: _listKey,
                    physics: const BouncingScrollPhysics(),
                    controller: _scrollController,
                    initialItemCount: _messages.length,
                    itemBuilder: (context, index, animation) {
                      return _messageItem(_messages[index], animation, index);
                    },
                  ),
                ),
              ),

              ///底部消息工具栏
              MessageChatBottomToolBars(
                key: _bottomToolsKey,
                handleSubmitted: _handleSubmitted,
              ),
            ],
          ),


        ],
      ),
    );
  }

  Widget _messageItem(ChatMessageEntity message, Animation<double> animation, int index) {
    // 使用 CurvedAnimation 设置贝塞尔曲线
    final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic);
    return GestureDetector(
      onLongPress: () {
        setState(() {
          ///长按移除元素
          _listKey.currentState?.removeItem(
            index,
            (context, animation) => _messageItem(message, animation, index),
            duration: _listViewAnimationController.duration!,
          );
          _messages.removeAt(index);
        });
      },
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(message.isMe ? 1.0 : -1.0, 0.0), // 是我 从右侧开始，是好友则从左侧开始
          end: const Offset(0.0, 0.0), // 移动到正常位置
        ).animate(curvedAnimation),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: EternalPadding.miniPadding, horizontal: EternalPadding.smallPadding),
          child: Column(
            children: [
              if (message.isExceedTwoMinute)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      DateFormat('HH:mm:ss').format(message.time),
                      style: TextStyle(fontSize: EternalFontSize.mini(), color: Colors.white70),
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///好友头像
                  if (!message.isMe) ...[
                    CircleAvatar(backgroundImage: NetworkImage(message.avatar), radius: 16),
                    const SizedBox(width: 10),
                  ],

                  ///消息内容
                  Container(
                    clipBehavior: Clip.hardEdge,
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    decoration: BoxDecoration(color: EternalColors.boxDefaultColor, borderRadius: BorderRadius.circular(15)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            message.isShowTime = !message.isShowTime;
                            _getContainerSize(message, false);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(message.text, style: TextStyle(fontSize: EternalFontSize.base(), color: Colors.white)),
                              AnimatedContainer(
                                height: message.containerHeight,
                                width: message.containerWidth,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(color: Colors.transparent),
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                                child: Column(
                                  children: [
                                    SizedBox(height: EternalMargin.miniMargin),
                                    Text(
                                      DateFormat('HH:mm:ss').format(message.time),
                                      style: TextStyle(fontSize: EternalFontSize.mini(), color: Colors.white70),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// 用户头像
                  if (message.isMe) ...[
                    const SizedBox(width: 10),
                    CircleAvatar(backgroundImage: NetworkImage(message.avatar), radius: 16),
                  ],
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
