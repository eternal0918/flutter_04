import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_font_size.dart';
import 'package:flutter_04/constants/eternal_icon_size.dart';

import '../../../constants/eternal_padding.dart';

class LoginRegister extends StatefulWidget {
  Function updatePageIndex;

  LoginRegister({super.key, required this.updatePageIndex});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  // 控制密码是否显示
  bool _passwordObscure = true;

  ButtonStyle btnStyle = OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: EternalPadding.smallPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30), // 添加圆角效果
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          image: const DecorationImage(image: NetworkImage("https://picsum.photos/512/512"), fit: BoxFit.fill),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.white10), borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(15, 0, 12, 0),
                              decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey.shade300))),
                              child: Icon(Icons.draw_outlined, size: EternalIconSize.defaultSize),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: TextField(
                                  style: TextStyle(fontSize: EternalFontSize.base()),
                                  decoration: const InputDecoration(labelText: '昵称', border: InputBorder.none),
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.white10), borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(15, 0, 12, 0),
                              decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey.shade300))),
                              child: Icon(Icons.style_outlined, size: EternalIconSize.defaultSize),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: TextField(
                                  style: TextStyle(fontSize: EternalFontSize.base()),
                                  decoration: const InputDecoration(labelText: '手机号码', border: InputBorder.none),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.white10), borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(15, 0, 12, 0),
                              decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey.shade300))),
                              child: Icon(Icons.password_rounded, size: EternalIconSize.defaultSize),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: TextField(
                                  obscureText: _passwordObscure,
                                  style: TextStyle(fontSize: EternalFontSize.base()),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: '密码',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordObscure ? Icons.visibility : Icons.visibility_off,
                                        color: EternalColors.selectColor,
                                        size: EternalIconSize.defaultSize,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordObscure = !_passwordObscure;
                                        });
                                      },
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 15),
                    // 电话号码输入框
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.white10), borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(15, 0, 12, 0),
                              decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey.shade300))),
                              child: Icon(Icons.password_rounded, size: EternalIconSize.defaultSize),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: TextField(
                                  obscureText: _passwordObscure,
                                  style: TextStyle(fontSize: EternalFontSize.base()),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: '确认密码',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordObscure ? Icons.visibility : Icons.visibility_off,
                                        color: EternalColors.selectColor,
                                        size: EternalIconSize.defaultSize,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordObscure = !_passwordObscure;
                                        });
                                      },
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // widget.updatePageIndex(0);
                      },
                      style: btnStyle,
                      child: Image.asset('assets/images/icons/qq.png', width: 20, height: 20),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {
                        // widget.updatePageIndex(0);
                      },
                      style: btnStyle,
                      child: Image.asset('assets/images/icons/wechat.png', width: 20, height: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {
                          widget.updatePageIndex(0);
                        },
                        style: btnStyle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login, size: EternalIconSize.defaultSize),
                            const SizedBox(width: 12),
                            Text('注册', style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular())),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
