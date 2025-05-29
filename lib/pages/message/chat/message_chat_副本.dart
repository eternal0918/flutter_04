// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_04/constants/eternal_margin.dart';
// import 'package:flutter_04/constants/eternal_padding.dart';
// import 'package:flutter_04/entity/message/chat/chat_message_entity.dart';
// import 'package:intl/intl.dart';
//
// import '../../../constants/eternal_colors.dart';
//
// class MessageChat extends StatefulWidget {
//   const MessageChat({super.key});
//
//   @override
//   State<MessageChat> createState() => _MessageChatState();
// }
//
// class _MessageChatState extends State<MessageChat> with WidgetsBindingObserver, SingleTickerProviderStateMixin {
//   final TextEditingController _textController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   final List<ChatMessageEntity> _messages = [];
//   final FocusNode _focusNode = FocusNode();
//   final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//   late AnimationController _listViewAnimationController;
//
// // 用于判断是否显示发送按钮
//   bool _isSendButtonVisible = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // 添加监听，didChangeMetrics
//     WidgetsBinding.instance.addObserver(this);
//
//     // 监听 TextField 的内容变化
//     _textController.addListener(() {
//       setState(() {
//         // 如果有输入内容，则显示发送按钮，否则隐藏
//         _isSendButtonVisible = _textController.text.isNotEmpty;
//       });
//     });
//
//     //设置 ListView动画效果
//     _listViewAnimationController = AnimationController(
//       duration: Duration(milliseconds: 500), // 设置动画持续时间为 500 毫秒
//       vsync: this,
//     );
//     for (int i = 0; i < 20; i++) {
//       int msgId1 = Random().nextInt(pow(2, 20).toInt());
//       int msgId2 = Random().nextInt(pow(2, 20).toInt());
//       var message1 = ChatMessageEntity(
//         msgId: msgId1,
//         text: '你好！',
//         isMe: false,
//         time: DateTime.now().subtract(const Duration(minutes: 5)),
//         avatar: 'https://picsum.photos/512/512',
//         userName: 'John',
//       );
//       var message2 = ChatMessageEntity(
//         msgId: msgId2,
//         text: '你好！最近怎么样？',
//         isMe: true,
//         time: DateTime.now().subtract(const Duration(minutes: 4)),
//         avatar: 'https://picsum.photos/512/412',
//         userName: 'Me',
//       );
//
//       // 添加一些测试消息
//       _messages.addAll([message1, message2]);
//
//       _getContainerSize(message1, true);
//       _getContainerSize(message2, true);
//     }
//     _scrollToBottom();
//   }
//
// // 当应用程序的尺寸发生变化时会调用
//   @override
//   void didChangeMetrics() {
//     _scrollToBottom();
//   }
//
// //发送消息方法
//   void _handleSubmitted(String text) {
//     if (text.isEmpty) return;
//     ChatMessageEntity lastMessage = _messages[_messages.length - 1];
//     var currentTime = DateTime.now();
//     Duration difference = DateTime.now().difference(lastMessage.time);
//     _textController.clear();
//     // 重新聚焦到 TextField
//     FocusScope.of(context).requestFocus(_focusNode);
//     setState(() {
//       bool isMe = Random().nextBool();
//       int msgId = Random().nextInt(pow(2, 20).toInt());
//       var message = ChatMessageEntity(
//         msgId: msgId,
//         text: text,
//         isMe: isMe,
//         time: currentTime,
//         avatar: 'https://picsum.photos/512/${isMe ? 412 : 512}',
//         userName: 'Me',
//         isExceedTwoMinute: difference.inMinutes >= 1,
//       );
//       _messages.add(message);
//       _getContainerSize(message, true);
//       _listKey.currentState?.insertItem(
//         _messages.length - 1,
//         //确保   AnimationController   的   duration   不为   null  ,可以加 !非空判断
//         duration: _listViewAnimationController.duration!,
//       ); // 触发动画
//     });
//     // 修改滚动逻辑，滚动到底部
//     _scrollToBottom();
//   }
//
// //消息列表滑动到底部
//   void _scrollToBottom() {
//     // 滑动到指定位置
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scrollController.animateTo(
//         //后面加个具体会出现动画弹跳的感觉
//         _scrollController.position.maxScrollExtent + 10,
//         duration: const Duration(milliseconds: 100),
//         curve: Curves.easeOut,
//       );
//     });
//   }
//
// //获取元素高度
//   _getContainerSize(ChatMessageEntity message, bool isInitFlag) {
//     if (!isInitFlag) {
//       setState(() {
//         message.containerHeight = message.containerHeight + (message.isShowTime ? 17 : -17);
//         message.containerWidth = message.containerWidth + (message.isShowTime ? 40 : -40);
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _textController.dispose();
//     _focusNode.dispose();
//     _scrollController.dispose();
//     _listViewAnimationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EternalColors.defaultColor,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: EternalColors.defaultColor,
//         leading: IconButton(icon: const Icon(Icons.arrow_back), splashRadius: 20, onPressed: () => Navigator.of(context).pop()),
//         title: Row(
//           children: [
//             const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/512/512'), radius: 20),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('John Doe', style: TextStyle(fontSize: 16)),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ClipRRect(borderRadius: BorderRadius.circular(50), child: Container(width: 10, height: 10, color: Colors.green)),
//                     const SizedBox(width: 5),
//                     const Text('在线', style: TextStyle(fontSize: 15))
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(icon: const Icon(Icons.segment), splashRadius: 20, onPressed: () {}),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTap: () {
//                   // 触摸收起键盘
//                   FocusScope.of(context).requestFocus(FocusNode());
//                 },
//                 child: AnimatedList(
//                   key: _listKey,
//                   physics: const BouncingScrollPhysics(),
//                   controller: _scrollController,
//                   initialItemCount: _messages.length,
//                   itemBuilder: (context, index, animation) {
//                     return _messageItem(_messages[index], animation, index);
//                   },
//                 )
//                 // ListView.builder(
//                 //   physics: const BouncingScrollPhysics(),
//                 //   controller: _scrollController,
//                 //   // reverse: true,
//                 //   padding: const EdgeInsets.all(8.0),
//                 //   itemCount: _messages.length,
//                 //   itemBuilder: (context, index) {
//                 //     // 修改索引获取方式，使最新消息显示在底部
//                 //     final message = _messages[index];
//                 //     return _messageItem(message, index);
//                 //   },
//                 // ),
//                 ),
//           ),
//
//           ///底部消息工具栏
//           _messageBottomToolBars(),
//         ],
//       ),
//     );
//   }
//
//   Widget _messageItem(ChatMessageEntity message, Animation<double> animation, int index) {
//     // 使用 CurvedAnimation 设置贝塞尔曲线
//     final curvedAnimation = CurvedAnimation(
//       parent: animation,
//       curve: Curves.easeInOutCubic, // 使用预定义的贝塞尔曲线
//     );
//     return GestureDetector(
//       onLongPress: () {
//         setState(() {
//           ///长按移除元素
//           _listKey.currentState?.removeItem(
//             index,
//             (context, animation) => _messageItem(message, animation, index),
//             duration: _listViewAnimationController.duration!,
//           );
//           _messages.removeAt(index);
//         });
//       },
//       child: SlideTransition(
//         position: Tween<Offset>(
//           begin: Offset(message.isMe ? 1.0 : -1.0, 0.0), // 是我 从右侧开始，是好友则从左侧开始
//           end: const Offset(0.0, 0.0), // 移动到正常位置
//         ).animate(curvedAnimation),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: EternalPadding.miniPadding, horizontal: EternalPadding.smallPadding),
//           child: Column(
//             children: [
//               if (message.isExceedTwoMinute)
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: Text(DateFormat('HH:mm:ss').format(message.time), style: const TextStyle(fontSize: 10, color: Colors.white70)),
//                   ),
//                 ),
//               Row(
//                 mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ///好友头像
//                   if (!message.isMe) ...[
//                     CircleAvatar(backgroundImage: NetworkImage(message.avatar), radius: 16),
//                     const SizedBox(width: 10),
//                   ],
//
//                   ///消息内容
//                   Container(
//                     clipBehavior: Clip.hardEdge,
//                     constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
//                     decoration: BoxDecoration(
//                       color: EternalColors.boxDefaultColor,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             message.isShowTime = !message.isShowTime;
//                             _getContainerSize(message, false);
//                           });
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(message.text, style: const TextStyle(color: Colors.white)),
//                               AnimatedContainer(
//                                 height: message.containerHeight,
//                                 width: message.containerWidth,
//                                 clipBehavior: Clip.hardEdge,
//                                 decoration: const BoxDecoration(color: Colors.transparent),
//                                 duration: const Duration(milliseconds: 300),
//                                 curve: Curves.fastOutSlowIn,
//                                 child: Column(
//                                   children: [
//                                     SizedBox(height: 5),
//                                     Text(DateFormat('HH:mm:ss').format(message.time), style: const TextStyle(fontSize: 10, color: Colors.white70))
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   /// 用户头像
//                   if (message.isMe) ...[
//                     const SizedBox(width: 10),
//                     CircleAvatar(backgroundImage: NetworkImage(message.avatar), radius: 16),
//                   ],
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _messageBottomToolBars() {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//       decoration: BoxDecoration(boxShadow: [BoxShadow(offset: const Offset(0, -2), blurRadius: 4, color: Colors.black.withOpacity(0.1))]),
//       child: Material(
//         color: EternalColors.boxDefaultColor,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: EternalPadding.miniPadding),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               IconButton(icon: const Icon(Icons.mic), splashRadius: 20, onPressed: () {}),
//               SizedBox(width: EternalMargin.miniMargin),
//               Expanded(
//                 child: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   focusColor: Colors.transparent,
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(_focusNode);
//                   },
//                   child: Container(
//                     clipBehavior: Clip.hardEdge,
//                     padding: EdgeInsets.all(EternalPadding.smallPadding),
//                     decoration: BoxDecoration(color: EternalColors.defaultColor, borderRadius: BorderRadius.circular(10)),
//                     child: TextField(
//                       controller: _textController,
//                       focusNode: _focusNode,
//                       decoration: const InputDecoration(
//                         hintText: '',
//                         border: InputBorder.none,
//                         isCollapsed: true,
//                       ),
//                       onSubmitted: _handleSubmitted,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: EternalMargin.miniMargin),
//               IconButton(icon: const Icon(Icons.sentiment_satisfied_alt), splashRadius: 20, onPressed: () {}),
//               if (!_isSendButtonVisible)
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   splashRadius: 20,
//                   onPressed: () {},
//                 ),
//               if (_isSendButtonVisible)
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_textController.text.isNotEmpty) {
//                       _handleSubmitted(_textController.text);
//                     }
//                   },
//                   child: const Text("发送", style: TextStyle(fontSize: 18)),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
