import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_padding.dart';

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
  FocusNode _actFocusNode = FocusNode();
  FocusNode _pwdFocusNode = FocusNode();

  @override
  void initState() {
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
      backgroundColor: EternalColors.defaultColor,
      resizeToAvoidBottomInset: false, //输入法不会顶起页面
      body: Stack(
        children: [
          const Positioned(left: 0, top: 0, child: LoginBg()),
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
                        Text(
                          'Sisyphus ai',
                          style: TextStyle(
                            fontSize: EternalFontSize.extraLargePlus(),
                            color: EternalColors.titleColor,
                            fontFamily: "Videopac",
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: EternalMargin.largeMargin),

                    ///其他方式登录

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
                        OutlinedButton(
                          onPressed: () {
                            // 微信 登录逻辑
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.black38,
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: Image.asset('assets/images/icons/wechat.png', width: 20, height: 20),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // 手机 登录逻辑
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.black38,
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          child: Icon(
                            Icons.phone_android,
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
                              color: Colors.white12,
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
                                color: const Color.fromRGBO(19, 19, 19, 1.0),
                                // color: Colors.yellow,
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
                                  SizedBox(height: EternalMargin.mainLargeMargin),

                                  ///账号
                                  TextField(
                                    focusNode: _actFocusNode,
                                    style: TextStyle(fontSize: EternalFontSize.base(), letterSpacing: 2),
                                    decoration: InputDecoration(
                                      label: Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        spacing: EternalMargin.miniMargin,
                                        children: [
                                          if (_actFocusNode.hasFocus) Icon(Icons.person, size: EternalIconSize.smallSize),
                                          Text("手机号/电子邮箱/账号"),
                                        ],
                                      ),
                                      floatingLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                                      floatingLabelAlignment: FloatingLabelAlignment.start,
                                      filled: true,
                                      fillColor: const Color.fromRGBO(255, 255, 255, 0.05),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        borderSide: BorderSide(color: Colors.white12),
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(height: EternalMargin.defaultMargin),

                                  ///密码
                                  TextField(
                                    focusNode: _pwdFocusNode,
                                    style: TextStyle(fontSize: EternalFontSize.regular(), letterSpacing: 4),
                                    decoration: InputDecoration(
                                      label: Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        spacing: EternalMargin.miniMargin,
                                        children: [
                                          if (_pwdFocusNode.hasFocus) Icon(Icons.password_rounded, size: EternalIconSize.smallSize),
                                          const Text("密码"),
                                        ],
                                      ),
                                      floatingLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                                      floatingLabelAlignment: FloatingLabelAlignment.start,
                                      filled: true,
                                      fillColor: const Color.fromRGBO(255, 255, 255, 0.05),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        borderSide: BorderSide(color: Colors.white12),
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(height: EternalMargin.miniMargin),

                                  ///用户协议
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: true,
                                        // 当前复选框的状态
                                        onChanged: (bool? value) {
                                          // 当复选框状态改变时调用
                                          // setState(() {
                                          //   _isChecked = value ?? false;
                                          // });
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
                                  ),
                                  SizedBox(height: EternalMargin.defaultMargin),

                                  ///登录按钮
                                  OutlinedButton(
                                    onPressed: () {
                                      // QQ 登录逻辑
                                    },
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 50),
                                      padding: EdgeInsets.zero,
                                      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.05),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                      side: const BorderSide(color: Colors.transparent),
                                    ),
                                    child: Text(
                                      "登录",
                                      style: TextStyle(
                                        fontSize: EternalFontSize.regular(),
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: EternalMargin.smallMargin,
                          top: 0,
                          child: Image.asset('assets/images/banner/login.png', width: 100, height: 100),
                        ),
                        Positioned(
                          right: 65,
                          top: 105,
                          child: ClipPath(
                            clipper: InverseTrapezoidClipper(),
                            child: Container(
                              width: 40,
                              height: 2,
                              margin: EdgeInsets.symmetric(horizontal: 2),
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

          ///装饰-上
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.17,
            child: RotatedBox(
              quarterTurns: 3,
              // child: ClipPath(
              //   clipper: TriangleClipper(),
              //   child: CustomPaint(
              //     painter: TriangleWithBorderPainter(),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: const Color.fromRGBO(255, 235, 59, .8),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: EternalPadding.smallPadding,
                      horizontal: EternalPadding.normalPadding,
                    ),
                    // padding: EdgeInsets.fromLTRB(
                    //   EternalPadding.mainLargePadding + EternalPadding.smallPadding,
                    //   EternalPadding.normalPadding,
                    //   EternalPadding.mainLargePadding + EternalPadding.smallPadding,
                    //   EternalPadding.miniPadding,
                    // ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.white, width: 0.0),
                        right: BorderSide(color: Colors.white, width: 1.0),
                        bottom: BorderSide(color: Colors.white, width: 1.0),
                        left: BorderSide(color: Colors.white, width: 1.0),
                      ),
                    ),
                    child: Text(
                      "caution",
                      style: TextStyle(
                        fontFamily: "Videopac",
                        color: EternalColors.titleColor,
                        letterSpacing: 5,
                        fontSize: EternalFontSize.mini(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //   ),
          // ),

          ///装饰-下
          Positioned(
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.02,
            child: RotatedBox(
              quarterTurns: 1,
              // child: ClipPath(
              //   clipper: TriangleClipper(),
              //   child: CustomPaint(
              //     painter: TriangleWithBorderPainter(),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: const Color.fromRGBO(255, 235, 59, .8),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: EternalPadding.smallPadding,
                      horizontal: EternalPadding.normalPadding,
                    ),
                    // padding: EdgeInsets.fromLTRB(
                    //   EternalPadding.mainLargePadding,
                    //   EternalPadding.normalPadding,
                    //   EternalPadding.mainLargePadding,
                    //   EternalPadding.miniPadding,
                    // ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.white, width: 0.0),
                        right: BorderSide(color: Colors.white, width: 1.0),
                        bottom: BorderSide(color: Colors.white, width: 1.0),
                        left: BorderSide(color: Colors.white, width: 1.0),
                      ),
                    ),
                    child: Text(
                      "caution",
                      style: TextStyle(
                        fontFamily: "Videopac",
                        color: EternalColors.titleColor,
                        letterSpacing: 5,
                        fontSize: EternalFontSize.mini(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //   ),
          // ),

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
                      colors: [
                        Colors.white30,
                        Colors.black,
                      ],
                    ),
                  ),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      side: BorderSide.none,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.white54, fontSize: EternalFontSize.base()),
                              children: const [
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
            ),
          )
        ],
      ),
    );
  }
}

///三角形裁切
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

///三角形边框
class TriangleWithBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 创建一个路径
    Path path = Path();
    // 移动到左下角
    path.moveTo(0, size.height);
    // 绘制到右下角
    path.lineTo(size.width, size.height);
    // 绘制到顶点
    path.lineTo(size.width / 2, 0);
    // 闭合路径
    path.close();

    // 绘制边框
    Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5; // 边框宽度
    canvas.drawPath(path, borderPaint);

    // // 绘制填充
    // Paint fillPaint = Paint()
    //   ..color = Colors.blue
    //   ..style = PaintingStyle.fill;
    // canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

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
