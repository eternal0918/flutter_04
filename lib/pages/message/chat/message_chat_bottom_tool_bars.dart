import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_curve.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../constants/eternal_colors.dart';
import '../../../constants/eternal_margin.dart';
import '../../../constants/eternal_padding.dart';

class MessageChatBottomToolBars extends StatefulWidget {
  final Function(String) handleSubmitted;

  const MessageChatBottomToolBars({super.key, required this.handleSubmitted});

  @override
  State<MessageChatBottomToolBars> createState() => MessageChatBottomToolBarsState();
}

class MessageChatBottomToolBarsState extends State<MessageChatBottomToolBars> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _iconController;
  late Animation<double> _rotationAnimation;

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
    super.initState();
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

  _onFocus() {
    if (!_focusNode.hasFocus && !_isBottomToolsVisible) {
      // 失去焦点时候的操作
      _bottomToolsHeight = 48;
    }
  }

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
      // 触摸收起键盘
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  closeBottomTools() {
    setState(() {
      _isBottomToolsVisible = false;
      _bottomToolsHeight = 48;
      _iconController.reverse();
    });
  }

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
                    IconButton(icon: const Icon(Icons.mic), splashRadius: 20, onPressed: () {}),
                    SizedBox(width: EternalMargin.miniMargin),
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
                    IconButton(icon: const Icon(Icons.sentiment_satisfied_alt), splashRadius: 20, onPressed: () {}),
                  ],
                  if (_isBottomToolsVisible)
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "工具栏",
                          style: TextStyle(fontSize: EternalFontSize.regular()),
                        )),
                  if (!_isSendButtonVisible)
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
                    ElevatedButton(
                      onPressed: () {
                        if (_textController.text.isNotEmpty) {
                          _onSubmit(_textController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                          backgroundColor: Colors.deepPurple),
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
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(EternalColors.defaultColor),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                              elevation: MaterialStateProperty.all(0),
                              overlayColor: MaterialStateProperty.all(Colors.white12),
                              // 设置圆角
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            child: Icon(LucideIcons.images, color: Colors.white),
                          ),
                          SizedBox(height: EternalMargin.smallMargin),
                          Text(
                            "相册",
                            style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(EternalColors.defaultColor),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                              elevation: MaterialStateProperty.all(0),
                              overlayColor: MaterialStateProperty.all(Colors.white12),
                              // 设置圆角
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            child: Icon(Icons.camera_alt_rounded, color: Colors.white),
                          ),
                          SizedBox(height: EternalMargin.smallMargin),
                          Text(
                            "拍照",
                            style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(EternalColors.defaultColor),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                              elevation: MaterialStateProperty.all(0),
                              overlayColor: MaterialStateProperty.all(Colors.white12),
                              // 设置圆角
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            child: Icon(Icons.snippet_folder_rounded, color: Colors.white),
                          ),
                          SizedBox(height: EternalMargin.smallMargin),
                          Text(
                            "文件",
                            style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor),
                          )
                        ],
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
