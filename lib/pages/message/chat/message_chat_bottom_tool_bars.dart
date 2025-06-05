import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_curve.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../constants/eternal_colors.dart';
import '../../../constants/eternal_margin.dart';
import '../../../constants/eternal_padding.dart';

class MessageChatBottomToolBars extends StatefulWidget {
  final Function(String) handleSubmitted;

  // final Function handleScrollToBottom;

  const MessageChatBottomToolBars({
    super.key,
    required this.handleSubmitted,
    // required this.handleScrollToBottom,
  });

  @override
  State<MessageChatBottomToolBars> createState() => MessageChatBottomToolBarsState();
}

class MessageChatBottomToolBarsState extends State<MessageChatBottomToolBars> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _iconController;
  late Animation<double> _rotationAnimation;
  late DraggableScrollableController _sheetController;

  ///本地所有相册
  late File _selectedImage;

  // 当前键盘是否是激活状态
  bool _isKeyboardActived = false;

  // 用于判断是否显示发送按钮
  bool _isSendButtonVisible = false;
  bool _isBottomToolsVisible = false;
  double _bottomToolsHeight = 48;

  @override
  void initState() {
    // 监听 TextField 的内容变化
    _textController.addListener(() {
      setState(() {
        // 如果有输入内容，则显示发送按钮，否则隐藏
        _isSendButtonVisible = _textController.text.isNotEmpty;
      });
    });
    _iconController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    // 45度转换为弧度
    _rotationAnimation = Tween<double>(begin: 0, end: 45 * 3.141592653589793 / 180 * 9).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.easeInOutExpo),
    );

    /// 监听输入框焦点变化
    _focusNode.addListener(_onFocus);

    WidgetsBinding.instance.addObserver(this);
    _sheetController = DraggableScrollableController();
    _sheetController.addListener(() {
      // print("高度：${_sheetController.size}");

      ///当高度占比为0.25时，直接关闭弹窗
      if (_sheetController.size == 0.25) {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  _onFocus() {
    if (!_focusNode.hasFocus && !_isBottomToolsVisible) {
      // 失去焦点时候的操作
      _bottomToolsHeight = 48;
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_focusNode.hasFocus) {
        _bottomToolsHeight = 48 + MediaQuery.of(context).viewInsets.bottom;
      }
      setState(() {
        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          /// 键盘收回
          _isKeyboardActived = false;
        } else {
          /// 键盘弹出
          _isKeyboardActived = true;
        }
      });
    });
  }

  ///工具栏 icon 动效
  void _openBottomTools() {
    setState(() {
      _isBottomToolsVisible = !_isBottomToolsVisible;
      if (_isBottomToolsVisible) {
        _bottomToolsHeight = 300;
        // 如果未旋转，旋转 45 度
        _iconController.forward();
      } else {
        _bottomToolsHeight = 48;
        _iconController.reverse();
      }

      ///调整消息列表，将其划到最底部
      // widget.handleScrollToBottom();
      // 触摸收起键盘
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  void _updateSelectedImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  closeBottomTools() {
    setState(() {
      _isBottomToolsVisible = false;
      _bottomToolsHeight = 48;
      _iconController.reverse();
    });
  }

  ///发送消息
  void _onSubmit(String text) {
    if (text.isEmpty) return;
    _textController.clear();
    widget.handleSubmitted(text);
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _iconController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _bottomToolsHeight,
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(boxShadow: [BoxShadow(offset: const Offset(0, -2), blurRadius: 4, color: Colors.black.withOpacity(0.1))]),
      duration: const Duration(milliseconds: 600),
      curve: EternalCurve.materialCurve2,
      child: Material(
        color: EternalColors.boxDefaultColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: EternalPadding.miniPadding),
          child: Column(
            children: [
              ///输入框
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!_isBottomToolsVisible) ...[
                    ///语音输入
                    IconButton(icon: const Icon(Icons.mic), splashRadius: 20, onPressed: () {}),
                    SizedBox(width: EternalMargin.miniMargin),

                    ///输入框
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: () {
                          FocusScope.of(context).requestFocus(_focusNode);
                          setState(() {
                            _isBottomToolsVisible = false;
                            _bottomToolsHeight = 48;
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          padding: EdgeInsets.all(EternalPadding.smallPadding),
                          decoration: BoxDecoration(color: EternalColors.defaultColor, borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            onTap: () {},
                            controller: _textController,
                            focusNode: _focusNode,
                            style: TextStyle(fontSize: EternalFontSize.regular()),
                            decoration: const InputDecoration(hintText: "", border: InputBorder.none, isCollapsed: true),
                            onSubmitted: _onSubmit,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: EternalMargin.miniMargin),

                    ///表情包
                    IconButton(icon: const Icon(Icons.sentiment_satisfied_alt), splashRadius: 20, onPressed: () {}),
                  ],
                  if (_isBottomToolsVisible)
                    TextButton(
                      onPressed: () {},
                      child: Text("工具栏", style: TextStyle(fontSize: EternalFontSize.regular())),
                    ),
                  if (!_isSendButtonVisible)

                    ///工具栏按钮
                    IconButton(
                      icon: AnimatedBuilder(
                        animation: _rotationAnimation,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _rotationAnimation.value, // 使用动画值作为旋转角度
                            child: const Icon(Icons.add),
                          );
                        },
                      ),
                      splashRadius: 20,
                      onPressed: () {
                        _openBottomTools();
                      },
                    ),
                  if (_isSendButtonVisible && !_isBottomToolsVisible)

                    ///发送按钮
                    ElevatedButton(
                      onPressed: () {
                        if (_textController.text.isNotEmpty) {
                          _onSubmit(_textController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: Text("发送", style: TextStyle(fontSize: EternalFontSize.regular(), color: EternalColors.titleColor)),
                    ),
                ],
              ),

              ///工具栏
              if (_isBottomToolsVisible)
                Expanded(
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: EternalPadding.defaultPadding),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 130, childAspectRatio: 1, mainAxisSpacing: 10),
                    children: [
                      ///按钮容器
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              ///相册弹窗
                              final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                              if (pickedImage != null) {
                                _updateSelectedImage(File(pickedImage.path));
                                print("文件数据：$_selectedImage");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(_selectedImage.path,style: TextStyle(color: Colors.white),),
                                    backgroundColor: EternalColors.defaultColor,
                                    duration: Duration(days: 1), // 设置一个非常长的时间，使其不会自动消失
                                    action: SnackBarAction(
                                      label: '关闭',
                                      textColor: Colors.white,
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).hideCurrentSnackBar(); // 关闭 SnackBar
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                foregroundColor: Colors.white,
                                backgroundColor: EternalColors.defaultColor,
                                padding: const EdgeInsets.all(20),
                                elevation: 0),
                            child: const Icon(LucideIcons.images, color: Colors.white),
                          ),
                          SizedBox(height: EternalMargin.smallMargin),
                          Text("相册", style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor))
                        ],
                      ),

                      ///按钮容器
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                foregroundColor: Colors.white,
                                backgroundColor: EternalColors.defaultColor,
                                padding: const EdgeInsets.all(20),
                                elevation: 0),
                            child: const Icon(Icons.camera_alt_rounded, color: Colors.white),
                          ),
                          SizedBox(height: EternalMargin.smallMargin),
                          Text("拍照", style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor))
                        ],
                      ),

                      ///按钮容器
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                foregroundColor: Colors.white,
                                backgroundColor: EternalColors.defaultColor,
                                padding: const EdgeInsets.all(20),
                                elevation: 0),
                            child: const Icon(Icons.snippet_folder_rounded, color: Colors.white),
                          ),
                          SizedBox(height: EternalMargin.smallMargin),
                          Text("文件", style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor))
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
