import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_04/components/eternal_alert_dialog.dart';
import 'package:flutter_04/components/eternal_segment_tab.dart';
import 'package:flutter_04/constants/eternal_curve.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/main.dart';
import 'package:flutter_04/pages/login/bg/login_bg.dart';
import 'package:flutter_04/pages/login/login/login_register.dart';
import 'package:flutter_04/pages/login/login/login_verify.dart';
import 'package:pinput/pinput.dart';

import '../../base/eternal_navigator_route.dart';
import '../../constants/eternal_colors.dart';
import '../../constants/eternal_constants.dart';
import '../../constants/eternal_icon_size.dart';
import '../home/home_page.dart';
import '../home_bottom_navigation_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  bool _isPhoneSelected = true;
  String _accountNumber = '';
  int _selectedTabIndex = 0;
  bool _isChecked = false;
  ButtonStyle btnStyle = OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );

  final TextEditingController _textController = TextEditingController();

  late PageController _pageController;
  final ValueNotifier<int> _currentPageIndex = ValueNotifier<int>(0); // 定义一个值监听器
  late AnimationController _animationController;

  // 透明度动画
  late List<Animation<double>> _opacityAnimations;
  late List<TextSpan> _textSpans;

  final String _text = '注册属于你的专属账号，开启梦幻绚丽创作之旅吧，让灵感在这里绽放，创意无限！';
  final TextStyle _style = TextStyle(fontSize: EternalFontSize.base(), color: Colors.transparent);

  @override
  void initState() {
    ///页面视图设置
    _pageController = PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 1, //页面占比 0~1
    );
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4));

    // 创建每个字符的透明度动画
    _opacityAnimations = List.generate(_text.length, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            (index / _text.length).clamp(0.0, 1.0),
            ((index + 1) / _text.length).clamp(0.0, 1.0),
          ),
        ),
      );
    });

    // 创建 TextSpan 列表
    _textSpans = List.generate(_text.length, (index) {
      return TextSpan(
        text: _text[index],
        style: _style,
      );
    });

    _currentPageIndex.addListener(() {
      _pageController.animateToPage(
        _currentPageIndex.value,
        duration: const Duration(milliseconds: 1000),
        curve: EternalCurve.materialCurve1,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // 定义回调函数
  void _updatePageIndex(int pageIndex) {
    setState(() {
      _currentPageIndex.value = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const Positioned(left: 0, child: LoginBg()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                AnimatedContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('登录',
                                    style: TextStyle(
                                      fontSize: EternalFontSize.extraLargePlus(),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 4,
                                    ))
                              ]),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Hello，欢迎访问', style: TextStyle(fontSize: EternalFontSize.regular(), color: Colors.white70)),
                                  SizedBox(width: 10),
                                  Text(
                                    'Sisyphus !',
                                    style: TextStyle(
                                      fontSize: EternalFontSize.mainLarge(),
                                      color: Colors.white,
                                      fontFamily: "Videopac",
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //头像
                          if (_currentPageIndex.value != 2)
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                                image: const DecorationImage(image: NetworkImage("https://picsum.photos/512/512"), fit: BoxFit.fill),
                              ),
                            ),
                        ],
                      ),
                      if (_currentPageIndex.value == 2)
                        Container(
                            width: 400,
                            height: 40,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return RichText(
                                  text: TextSpan(
                                    children: List.generate(_text.length, (index) {
                                      return TextSpan(
                                        text: _text[index],
                                        style: _style.copyWith(
                                          color: Colors.white70.withOpacity(_opacityAnimations[index].value),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            )),
                      SizedBox(height: _currentPageIndex.value != 2 ? 40 : 20),
                    ],
                  ),
                ),

                // const SizedBox(height: 50),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //登陆页面
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: EternalSegmentTab(
                              tabs: const ['手机号码', '邮箱'],
                              tabIcons: const [Icons.style_outlined, Icons.email_outlined],
                              onTabSelected: (index) {
                                setState(() {
                                  _selectedTabIndex = index;
                                  _isPhoneSelected = _selectedTabIndex == 0;
                                });
                              },
                              initialIndex: _selectedTabIndex,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30), // 添加圆角效果
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _isPhoneSelected ? '手机号码' : '邮箱',
                                        style: TextStyle(fontSize: EternalFontSize.base(), fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 15),

                                      // 电话号码输入框
                                      Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.white10), borderRadius: BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.fromLTRB(15, 0, 12, 0),
                                              decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey.shade300))),
                                              child: Icon(_isPhoneSelected ? Icons.style_outlined : Icons.email_outlined, size: 20),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                                child: TextField(
                                                  style: TextStyle(fontSize: EternalFontSize.base()),
                                                  controller: _textController,
                                                  decoration: InputDecoration(
                                                    hintText: _isPhoneSelected ? '18069436480' : 'xxxx@163.com',
                                                    border: InputBorder.none,
                                                  ),
                                                  keyboardType: TextInputType.phone,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _accountNumber = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            // if (accountNumber.isNotEmpty)
                                            const Padding(
                                              padding: EdgeInsets.only(right: 10),
                                              child: Icon(Icons.task_alt, color: Colors.lightBlue, size: 20),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 25),

                                      // 发送验证码按钮
                                      OutlinedButton(
                                        onPressed: () {
                                          // 发送验证码逻辑
                                          _updatePageIndex(1);
                                        },
                                        style: btnStyle,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.ads_click, size: 20),
                                            SizedBox(width: 12),
                                            Text(
                                              '获取验证码',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: EternalFontSize.regular(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 25),

                                      // 分隔线
                                      Row(
                                        children: [
                                          Expanded(child: Container(height: 1, color: Colors.grey.shade600)),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                            child: Text(
                                              '其他方式登录，如 QQ 或 微信',
                                              style: TextStyle(color: Colors.grey.shade500, fontSize: EternalFontSize.base()),
                                            ),
                                          ),
                                          Expanded(child: Container(height: 1, color: Colors.grey.shade600)),
                                        ],
                                      ),

                                      const SizedBox(height: 25),

                                      // QQ 登录按钮
                                      OutlinedButton(
                                        onPressed: () {
                                          // QQ 登录逻辑
                                        },
                                        style: btnStyle,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/images/icons/qq.png', width: 20, height: 20),
                                            const SizedBox(width: 12),
                                            Text('QQ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular())),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 15),

                                      // 微信 登录按钮
                                      OutlinedButton(
                                        onPressed: () {
                                          // 微信 登录逻辑
                                        },
                                        style: btnStyle,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/images/icons/wechat.png', width: 20, height: 20),
                                            const SizedBox(width: 12),
                                            Text('微信', style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular())),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: _isChecked,
                                            // 当前复选框的状态
                                            onChanged: (bool? value) {
                                              // 当复选框状态改变时调用
                                              setState(() {
                                                _isChecked = value ?? false;
                                              });
                                            },
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05)),
                                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                              return Colors.transparent;
                                            }),
                                            side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                                              // if (states.contains(MaterialState.selected)) {
                                              //   return BorderSide(color: Colors.white, width: 2);
                                              // }
                                              return const BorderSide(color: Colors.white, width: 2);
                                            }),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(color: Colors.white54, fontSize: EternalFontSize.base()),
                                              children: const [
                                                TextSpan(text: '已阅读并同意  '),
                                                TextSpan(text: '“用户协议”', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                                TextSpan(text: '  和  '),
                                                TextSpan(text: '“隐私政策”', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //验证码页面
                      LoginVerify(selectTabIndex: _selectedTabIndex),
                      LoginRegister(updatePageIndex: _updatePageIndex)
                    ],
                  ),
                ),

                const Spacer(),

                // 注册新账户
                if (_currentPageIndex.value != 2)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: OutlinedButton(
                        onPressed: () {
                          _updatePageIndex(2);
                          _animationController.forward();
                        },
                        style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), side: BorderSide.none),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.white54, fontSize: EternalFontSize.base()),
                                  children: [
                                    TextSpan(text: '目前没有账号? '),
                                    TextSpan(text: '去注册', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_right, size: EternalIconSize.defaultSize, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          WillPopScope(
            onWillPop: () async {
              if (_currentPageIndex.value != 0) {
                setState(() {
                  _currentPageIndex.value = 0;
                });
                return false;
              } else {
                EternalNavigatorRoute.pushAndRemoveUntil(context, MyApp());
                return true;
                // 返回键点击事件的回调
                // return await showDialog(
                //   context: context,
                //   builder: (context) => EternalAlertDialog(
                //     title: '确认退出',
                //     content: const Text('你确定要退出应用吗？'),
                //     titleIcon: const Icon(Icons.error_rounded),
                //     cancelContent: const Text("取消"),
                //     confirmContent: const Text("确认"),
                //     confirm: () {
                //       // Navigator.of(context).pop();
                //       // Navigator.of(context).pop();
                //       EternalNavigatorRoute.pushAndRemoveUntil(context, MyApp());
                //     },
                //     cancel: () {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                // );
              }
            },
            child: const SizedBox(),
          )
        ],
      ),
    );
  }
}
