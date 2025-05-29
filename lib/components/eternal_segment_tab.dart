import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';

class EternalSegmentTab extends StatefulWidget {
  final List<String> tabs;
  final List<IconData> tabIcons;
  final Function(int) onTabSelected;
  final int initialIndex;

  const EternalSegmentTab({
    Key? key,
    required this.tabs,
    required this.tabIcons,
    required this.onTabSelected,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<EternalSegmentTab> createState() => _EternalSegmentTabState();
}

class _EternalSegmentTabState extends State<EternalSegmentTab> with SingleTickerProviderStateMixin {
  late int _selectedIndex;
  late int _previousIndex;

  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool defaultFlag = true;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _previousIndex = widget.initialIndex;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: const Cubic(0.00, 0.95, 0.35, 1.00),
    );
    _animationController.forward(from: 0);

    // // 监听动画状态
    // _animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     // 动画结束时触发的方法
    //     defaultColorFlag = false;
    //   }
    // });
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
  }

  void _selectTab(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _previousIndex = _selectedIndex;
      _selectedIndex = index;
      _animationController.forward(from: 0);
      widget.onTabSelected(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.black26),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // 获取父容器的最大宽度（会自动减去父容器的 padding）
              double parentWidth = constraints.maxWidth;
              double parentHeight = constraints.maxHeight;
              // print("父容器宽度：${parentWidth}");
              // print("设备宽度：${MediaQuery.of(context).size.width}");
              return Stack(
                children: [
                  // 动画背景指示器
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      // 计算动画位置
                      final double width = parentWidth;
                      final tabWidth = width / widget.tabs.length;
                      final startPosition = _previousIndex * tabWidth;
                      final endPosition = _selectedIndex * tabWidth;
                      final currentPosition = startPosition + (_animation.value * (endPosition - startPosition));

                      return Positioned(
                        left: currentPosition,
                        child: Container(
                          width: tabWidth,
                          height: parentHeight,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  // 标签按钮
                  Row(
                    children: List.generate(
                      widget.tabs.length,
                      (index) => Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => _selectTab(index),
                          child: AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              // 计算文本颜色的过渡
                              Color? textColor;
                              if (defaultFlag) {
                                textColor = index == 0 ? Colors.black : Colors.white70;
                                if (_animation.value > 0.5) {
                                  defaultFlag = false;
                                  textColor = Color.lerp(Colors.black, Colors.white70, _animation.value)!;
                                }
                              } else {
                                if (index == _selectedIndex) {
                                  // 从灰色过渡到黑色
                                  textColor = Color.lerp(Colors.white70, Colors.black, _animation.value)!;
                                } else {
                                  // 从黑色过渡到灰色
                                  textColor = Color.lerp(Colors.black, Colors.white70, _animation.value)!;
                                }
                                // else {
                                // textColor = Colors.white70;
                                // }
                                //   print('${_selectedIndex}');
                              }
                              return Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      widget.tabIcons[index],
                                      color: textColor,
                                      size: EternalIconSize.smallSize,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      widget.tabs[index],
                                      style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
