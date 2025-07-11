import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/base/eternal_navigator_route.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/login/login/login_register.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../constants/eternal_constants.dart';
import '../../constants/eternal_curve.dart';
import '../../constants/eternal_font_size.dart';
import '../../constants/eternal_icon_size.dart';
import '../../constants/eternal_margin.dart';
import 'bg/login_bg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final FocusNode _actFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();
  final FocusNode _verifyFocusNode = FocusNode();
  late PageController _textPageController, _quickPageController;
  late final ValueNotifier<int> _currentTextPageIndex = ValueNotifier<int>(0); // 定义一个值监听器
  late final ValueNotifier<int> _currentQuickPageIndex = ValueNotifier<int>(0); // 定义一个值监听器
  bool _isChecked = false;

  @override
  void initState() {
    _textPageController = PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 1, //页面占比 0~1
    );
    _currentTextPageIndex.addListener(() {
      _textPageController.animateToPage(
        _currentTextPageIndex.value,
        duration: const Duration(milliseconds: 600),
        curve: EternalCurve.materialCurve1,
      );
    });
    _quickPageController = PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 1, //页面占比 0~1
    );
    _currentQuickPageIndex.addListener(() {
      _quickPageController.animateToPage(
        _currentQuickPageIndex.value,
        duration: const Duration(milliseconds: 600),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false, //输入法不会顶起页面
      body: Stack(
        children: [
          Positioned(left: 0, top: 0, child: LoginBg(heightRate: 0.5)),
          Positioned(
            top: 0,
            left: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    // 渐变方向，从左到右
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.transparent,
                      Colors.black38,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),

                    /// logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo/logo.png', width: 40),
                        SizedBox(width: EternalMargin.normalMargin),
                        const Text(
                          'Sisyphus ai',
                          style: TextStyle(
                            fontSize: 40,
                            color: EternalColors.titleColor,
                            fontFamily: "Videopac",
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: EternalMargin.largeMargin),

                    ///其他方式登录

                    // Text("${_currentQuickPageIndex.value}"),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: OutlinedButton(
                            onPressed: () {
                              // QQ 登录逻辑
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              side: const BorderSide(color: Colors.white54),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/icons/qq.png', width: 17, height: 17),
                                const SizedBox(width: 12),
                                Text('QQ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular())),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: EternalMargin.normalMargin),
                        SizedBox(
                          width: 100,
                          child: OutlinedButton(
                            onPressed: () {
                              // QQ 登录逻辑
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              side: const BorderSide(color: Colors.white54),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/icons/wechat.png', width: 20, height: 20),
                                const SizedBox(width: 12),
                                Text('微信', style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular())),
                              ],
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // 手机 登录逻辑
                            setState(() {
                              _currentTextPageIndex.value = _currentTextPageIndex.value == 1 ? 0 : 1;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(color: Colors.grey),
                          ),
                          child: Icon(
                            _currentTextPageIndex.value == 0 ? Icons.verified_user_outlined : Icons.phone_android,
                            size: EternalIconSize.smallSize,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: EternalMargin.largeMargin),

                    /// 分隔线
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: EternalPadding.miniPadding),
                      child: Row(
                        children: [
                          Expanded(child: Container(height: 1, color: Colors.white24)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: EternalPadding.normalPadding),
                            child: Text(
                              '继续使用账号、手机号或邮箱登录',
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: EternalFontSize.base(),
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          Expanded(child: Container(height: 1, color: Colors.white24)),
                        ],
                      ),
                    ),
                    SizedBox(height: EternalMargin.smallMargin),

                    ///登录
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - EternalMargin.normalMargin * 2,
                          height: 420,
                          // color: Colors.yellow,
                        ),
                        Positioned(
                          right: 0,
                          top: 60,
                          width: MediaQuery.of(context).size.width - EternalMargin.normalMargin * 2,
                          height: 350,
                          child: Container(
                            padding: const EdgeInsets.all(0.5),
                            decoration: ShapeDecoration(
                              gradient: const LinearGradient(
                                // 渐变方向，从左到右
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white12,
                                  Colors.transparent,
                                  Colors.transparent,
                                ],
                              ),
                              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                EternalPadding.defaultPadding,
                                EternalPadding.mainLargePadding,
                                EternalPadding.defaultPadding,
                                0,
                              ),
                              decoration: ShapeDecoration(
                                // color: Colors.yellow,
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [Color.fromRGBO(19, 19, 19, 1.0), Colors.black, Colors.black],
                                ),
                                shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Hello~',
                                        style: TextStyle(
                                            fontFamily: "Videopac",
                                            fontWeight: FontWeight.bold,
                                            color: EternalColors.titleColor,
                                            letterSpacing: 2,
                                            fontSize: EternalFontSize.extraLarge()),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 280,
                                    // color: Colors.red,
                                    child: PageView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      controller: _quickPageController,
                                      children: [
                                        //普通登录界面
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: EternalMargin.mainLargeMargin),

                                            ///账号
                                            TextField(
                                              focusNode: _actFocusNode,
                                              style: TextStyle(fontSize: EternalFontSize.regular(), letterSpacing: 4),
                                              decoration: const InputDecoration(
                                                label: Text("手机号/电子邮箱/账号"),
                                                floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                                floatingLabelAlignment: FloatingLabelAlignment.start,
                                                filled: true,
                                                fillColor: Color.fromRGBO(255, 255, 255, 0.05),
                                                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                                  borderSide: BorderSide(color: Colors.white12),
                                                ),
                                              ),
                                              keyboardType: TextInputType.text,
                                              onChanged: (value) {},
                                            ),

                                            // SizedBox(height: EternalMargin.defaultMargin),

                                            SizedBox(
                                              height: 70,
                                              child: PageView(
                                                controller: _textPageController,
                                                scrollDirection: Axis.vertical,
                                                physics: const NeverScrollableScrollPhysics(),
                                                children: [
                                                  ///验证码
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0, EternalPadding.defaultPadding, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child: TextField(
                                                              focusNode: _verifyFocusNode,
                                                              style: TextStyle(fontSize: EternalFontSize.regular(), letterSpacing: 4),
                                                              decoration: const InputDecoration(
                                                                label: Text("验证码"),
                                                                floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                                                floatingLabelAlignment: FloatingLabelAlignment.start,
                                                                filled: true,
                                                                fillColor: Color.fromRGBO(255, 255, 255, 0.05),
                                                                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                                                border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                                                  borderSide: BorderSide(color: Colors.white12),
                                                                ),
                                                              ),
                                                              keyboardType: TextInputType.number,
                                                              onChanged: (value) {},
                                                            )),
                                                        SizedBox(width: EternalMargin.smallMargin),

                                                        ///获取验证码按钮
                                                        OutlinedButton(
                                                          onPressed: () {
                                                            //
                                                          },
                                                          style: OutlinedButton.styleFrom(
                                                            padding: EdgeInsets.zero,
                                                            minimumSize: const Size(80, 50),
                                                            backgroundColor: const Color.fromRGBO(19, 19, 19, 1.0),
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                                            side: const BorderSide(color: Colors.transparent),
                                                          ),
                                                          child: Text("获取", style: TextStyle(fontSize: EternalFontSize.regular(), letterSpacing: 2)),
                                                        )
                                                      ],
                                                    ),
                                                  ),

                                                  ///密码
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(0, EternalPadding.defaultPadding, 0, 0),
                                                    child: TextField(
                                                      focusNode: _pwdFocusNode,
                                                      style: TextStyle(fontSize: EternalFontSize.regular(), letterSpacing: 4),
                                                      decoration: const InputDecoration(
                                                        label: Text("密码"),
                                                        floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                                        floatingLabelAlignment: FloatingLabelAlignment.start,
                                                        filled: true,
                                                        fillColor: Color.fromRGBO(255, 255, 255, 0.05),
                                                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                                          borderSide: BorderSide(color: Colors.white12),
                                                        ),
                                                      ),
                                                      keyboardType: TextInputType.visiblePassword,
                                                      onChanged: (value) {},
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(height: EternalMargin.miniMargin),

                                            ///用户协议
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
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
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                                    return Colors.transparent;
                                                  }),
                                                  side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                                                    return const BorderSide(color: EternalColors.textColor, width: 2);
                                                  }),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(color: EternalColors.textColor, fontSize: EternalFontSize.base()),
                                                    children: const [
                                                      TextSpan(text: '已阅读并同意  '),
                                                      TextSpan(
                                                        text: '“用户协议”',
                                                        style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold),
                                                      ),
                                                      TextSpan(text: '  和  '),
                                                      TextSpan(
                                                        text: '“隐私政策”',
                                                        style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: EternalMargin.defaultMargin),

                                            ///登录按钮
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: OutlinedButton.icon(
                                                    onPressed: () {
                                                      // 快捷登录逻辑
                                                      setState(() {
                                                        _currentQuickPageIndex.value = 1;
                                                      });
                                                    },
                                                    style: OutlinedButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      minimumSize: const Size(0, 50),
                                                      backgroundColor: const Color.fromRGBO(68, 138, 255, 0.2),
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                                      foregroundColor: Color.fromRGBO(68, 138, 255, 0.5),
                                                      side: const BorderSide(color: Colors.transparent),
                                                    ),
                                                    icon: Icon(
                                                      Icons.flash_on_rounded,
                                                      size: EternalIconSize.smallSize,
                                                      color: Colors.blueAccent,
                                                    ),
                                                    label: Text(
                                                      "快捷登录",
                                                      style: TextStyle(
                                                        fontSize: EternalFontSize.medium(),
                                                        fontWeight: FontWeight.bold,
                                                        letterSpacing: 2,
                                                        color: Colors.blueAccent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: EternalMargin.defaultMargin),
                                                Expanded(
                                                  flex: 1,
                                                  child: OutlinedButton.icon(
                                                    onPressed: () {
                                                      // QQ 登录逻辑
                                                    },
                                                    style: OutlinedButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      minimumSize: const Size(0, 50),
                                                      backgroundColor: const Color.fromRGBO(19, 19, 19, 1.0),
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                                      side: const BorderSide(color: Colors.transparent),
                                                    ),
                                                    icon: Icon(
                                                      Icons.login_rounded,
                                                      size: EternalIconSize.smallSize,
                                                    ),
                                                    label: Text(
                                                      "登录",
                                                      style: TextStyle(
                                                        fontSize: EternalFontSize.medium(),
                                                        fontWeight: FontWeight.bold,
                                                        letterSpacing: 2,
                                                        color: EternalColors.titleColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(height: EternalMargin.largeMargin),
                                            SizedBox(height: EternalMargin.defaultMargin),
                                            Container(
                                              // color: Colors.red,
                                              height: 80,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          //  切换到登录页面
                                                          setState(() {
                                                            _currentQuickPageIndex.value = 0;
                                                          });
                                                        },
                                                        style: OutlinedButton.styleFrom(
                                                            shape: const CircleBorder(),
                                                            backgroundColor: Colors.transparent,
                                                            side: const BorderSide(color: EternalColors.boxDefaultColor, width: 4),
                                                            minimumSize: const Size(58, 58)),
                                                        child: Icon(Icons.add, size: EternalIconSize.smallSize),
                                                      ),
                                                      SizedBox(height: EternalMargin.miniMargin),
                                                      Text(
                                                        "添加",
                                                        style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.titleColor),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(width: EternalMargin.defaultMargin),
                                                  Expanded(
                                                      flex: 1,
                                                      child: ListView.separated(
                                                        physics: const BouncingScrollPhysics(),
                                                        scrollDirection: Axis.horizontal,
                                                        addAutomaticKeepAlives: false,
                                                        addRepaintBoundaries: false,
                                                        itemBuilder: (BuildContext context, int index) {
                                                          ///热门作者
                                                          return Column(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  color: EternalColors.defaultColor,
                                                                  border: Border.all(
                                                                    color: index == 0 ? EternalColors.titleColor : EternalColors.boxDefaultColor,
                                                                    width: 4,
                                                                  ),
                                                                ),
                                                                child: ClipOval(
                                                                  child: CachedNetworkImage(
                                                                    imageUrl: EternalConstants.getImage(),
                                                                    height: 50,
                                                                    width: 50,
                                                                    fit: BoxFit.cover,
                                                                    placeholder: (context, url) => const CircularProgressIndicator(),
                                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: EternalMargin.miniMargin),
                                                              Text(
                                                                "张三",
                                                                style: TextStyle(fontSize: EternalFontSize.base(), color: EternalColors.textColor),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                        separatorBuilder: (BuildContext context, int index) {
                                                          return SizedBox(width: EternalMargin.normalMargin);
                                                        },
                                                        itemCount: 10,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: EternalMargin.defaultMargin),
                                            Text(
                                              "鸿雁秋凉",
                                              style: TextStyle(
                                                color: EternalColors.titleColor,
                                                fontSize: EternalFontSize.large(),
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: EternalMargin.defaultMargin),

                                            ///快速登录按钮
                                            OutlinedButton(
                                              onPressed: () {
                                                //
                                              },
                                              style: OutlinedButton.styleFrom(
                                                minimumSize: const Size(double.infinity, 50),
                                                padding: EdgeInsets.zero,
                                                backgroundColor: const Color.fromRGBO(19, 19, 19, 1.0),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                                side: const BorderSide(color: Colors.transparent),
                                              ),
                                              child: Text(
                                                "登录此账号",
                                                style: TextStyle(
                                                  fontSize: EternalFontSize.medium(),
                                                  letterSpacing: 2,
                                                  color: EternalColors.titleColor,
                                                ),
                                              ),
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
                        ),
                        // Positioned(
                        //   right: 60,
                        //   top: 10,
                        //   child: Transform.rotate(
                        //     angle: 90 * (3.141592653589793 / 180),
                        //     child: Container(
                        //       child: Lottie.asset('assets/lottie/congratulation_bottom_center.json', width: 50, height: 120, fit: BoxFit.fill),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                            right: EternalMargin.smallMargin,
                            top: 0,
                            child: SimpleShadow(
                              opacity: 1,
                              color: Colors.black,
                              offset: const Offset(0, 8),
                              sigma: 10,
                              child: Image.asset('assets/images/banner/login.png', width: 100, height: 100), // Default: 2
                            )),
                        Positioned(
                          right: 68,
                          top: 103,
                          child: ClipPath(
                            clipper: InverseTrapezoidClipper(),
                            child: Container(
                              width: 40,
                              height: 1,
                              margin: EdgeInsets.symmetric(horizontal: 0.5),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    spreadRadius: 5, // 阴影扩散范围
                                    blurRadius: 15, // 阴影模糊程度
                                    offset: Offset(0, -10), // 阴影偏移量
                                  ),
                                  BoxShadow(
                                    color: Color.fromRGBO(255, 255, 255, 0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, -2),
                                  ),
                                  BoxShadow(
                                    color: Color.fromRGBO(255, 255, 255, 0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, -5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          ///注册按钮
          Positioned(
            bottom: 20,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Center(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      // 渐变方向，从左到右
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [Colors.white30, Colors.black],
                    ),
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      // EternalNavigatorRoute.push(context, LoginRegister());
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                      side: BorderSide.none,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: EternalColors.textColor, fontSize: EternalFontSize.base(), letterSpacing: 0),
                              children: const [
                                TextSpan(text: '未注册的手机号验证后  '),
                                TextSpan(text: '自动注册', style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          // Icon(Icons.arrow_right, size: EternalIconSize.defaultSize, color: EternalColors.titleColor)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )

          // ///装饰-上
          // Positioned(
          //   left: 0,
          //   top: MediaQuery.of(context).size.height * 0.17,
          //   child: RotatedBox(
          //     quarterTurns: 3,
          //     // child: ClipPath(
          //     //   clipper: TriangleClipper(),
          //     //   child: CustomPaint(
          //     //     painter: TriangleWithBorderPainter(),
          //     child: Material(
          //       color: Colors.transparent,
          //       child: InkWell(
          //         splashColor: const Color.fromRGBO(255, 235, 59, .8),
          //         onTap: () {},
          //         child: Container(
          //           padding: EdgeInsets.symmetric(
          //             vertical: EternalPadding.smallPadding,
          //             horizontal: EternalPadding.normalPadding,
          //           ),
          //           // padding: EdgeInsets.fromLTRB(
          //           //   EternalPadding.mainLargePadding + EternalPadding.smallPadding,
          //           //   EternalPadding.normalPadding,
          //           //   EternalPadding.mainLargePadding + EternalPadding.smallPadding,
          //           //   EternalPadding.miniPadding,
          //           // ),
          //           decoration: const BoxDecoration(
          //             border: Border(
          //               top: BorderSide(color: Colors.white, width: 0.0),
          //               right: BorderSide(color: Colors.white, width: 1.0),
          //               bottom: BorderSide(color: Colors.white, width: 1.0),
          //               left: BorderSide(color: Colors.white, width: 1.0),
          //             ),
          //           ),
          //           child: Text(
          //             "caution",
          //             style: TextStyle(
          //               fontFamily: "Videopac",
          //               color: EternalColors.titleColor,
          //               letterSpacing: 5,
          //               fontSize: EternalFontSize.mini(),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // //   ),
          // // ),

          // ///装饰-下
          // Positioned(
          //   right: 0,
          //   bottom: MediaQuery.of(context).size.height * 0.02,
          //   child: RotatedBox(
          //     quarterTurns: 1,
          //     // child: ClipPath(
          //     //   clipper: TriangleClipper(),
          //     //   child: CustomPaint(
          //     //     painter: TriangleWithBorderPainter(),
          //     child: Material(
          //       color: Colors.transparent,
          //       child: InkWell(
          //         splashColor: const Color.fromRGBO(255, 235, 59, .8),
          //         onTap: () {},
          //         child: Container(
          //           padding: EdgeInsets.symmetric(
          //             vertical: EternalPadding.smallPadding,
          //             horizontal: EternalPadding.normalPadding,
          //           ),
          //           // padding: EdgeInsets.fromLTRB(
          //           //   EternalPadding.mainLargePadding,
          //           //   EternalPadding.normalPadding,
          //           //   EternalPadding.mainLargePadding,
          //           //   EternalPadding.miniPadding,
          //           // ),
          //           decoration: const BoxDecoration(
          //             border: Border(
          //               top: BorderSide(color: Colors.white, width: 0.0),
          //               right: BorderSide(color: Colors.white, width: 1.0),
          //               bottom: BorderSide(color: Colors.white, width: 1.0),
          //               left: BorderSide(color: Colors.white, width: 1.0),
          //             ),
          //           ),
          //           child: Text(
          //             "caution",
          //             style: TextStyle(
          //               fontFamily: "Videopac",
          //               color: EternalColors.titleColor,
          //               letterSpacing: 5,
          //               fontSize: EternalFontSize.mini(),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // //   ),
          // // ),
        ],
      ),
    );
  }
}

//
// ///三角形裁切
// class TriangleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width / 2, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
//
// ///三角形边框
// class TriangleWithBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // 创建一个路径
//     Path path = Path();
//     // 移动到左下角
//     path.moveTo(0, size.height);
//     // 绘制到右下角
//     path.lineTo(size.width, size.height);
//     // 绘制到顶点
//     path.lineTo(size.width / 2, 0);
//     // 闭合路径
//     path.close();
//
//     // 绘制边框
//     Paint borderPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.5; // 边框宽度
//     canvas.drawPath(path, borderPaint);
//
//     // // 绘制填充
//     // Paint fillPaint = Paint()
//     //   ..color = Colors.blue
//     //   ..style = PaintingStyle.fill;
//     // canvas.drawPath(path, fillPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
///倒梯形裁切
class InverseTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // 定义倒梯形的四个顶点
    path.moveTo(0, size.height); // 左下角
    path.lineTo(size.width, size.height); // 右下角
    path.lineTo(size.width * 2, size.height - 50); // 右上角（向上偏移）
    path.lineTo(size.width * -1, size.height - 50); // 左上角（向上偏移）
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
