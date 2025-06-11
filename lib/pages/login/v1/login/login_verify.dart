// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_04/constants/eternal_font_size.dart';
// import 'package:flutter_04/main.dart';
// import 'package:pinput/pinput.dart';
//
// import '../../../base/eternal_navigator_route.dart';
// import '../../../constants/eternal_colors.dart';
// import '../../../constants/eternal_icon_size.dart';
// import '../../../constants/eternal_padding.dart';
// import '../../home_bottom_navigation_bar.dart';
//
// class LoginVerify extends StatefulWidget {
//   final int selectTabIndex;
//
//   const LoginVerify({super.key, required this.selectTabIndex});
//
//   @override
//   State<LoginVerify> createState() => _LoginVerifyState();
// }
//
// class _LoginVerifyState extends State<LoginVerify> {
//   late TextEditingController pinController = TextEditingController();
//   final focusNode = FocusNode();
//   ButtonStyle btnStyle = OutlinedButton.styleFrom(
//     padding: const EdgeInsets.symmetric(vertical: 16),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     const focusedBorderColor = Colors.white;
//     const fillColor = Colors.transparent;
//     const borderColor = Colors.white10;
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(
//         fontSize: EternalFontSize.large(),
//         color: Colors.white,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: borderColor),
//       ),
//     );
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(30), // 添加圆角效果
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
//           child: Container(
//             color: Colors.black.withOpacity(0.2),
//             padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(EternalPadding.defaultPadding),
//                   decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black26),
//                   child: const Icon(Icons.screen_lock_portrait, size: 50),
//                 ),
//                 Text("验证码", style: TextStyle(fontSize: EternalFontSize.mainLarge(), fontWeight: FontWeight.bold, letterSpacing: 4)),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.7,
//                   child: Text(
//                     "我们已经将验证码发送到了你的${widget.selectTabIndex == 0 ? '手机' : '邮箱'}上请注意查收。",
//                     style: TextStyle(color: EternalColors.textColor, letterSpacing: 2, fontSize: EternalFontSize.base()),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 //验证码输入框
//                 Pinput(
//                   controller: pinController,
//                   focusNode: focusNode,
//                   androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
//                   listenForMultipleSmsOnAndroid: true,
//                   defaultPinTheme: defaultPinTheme,
//                   length: 5,
//                   validator: (value) {
//                     return value == '11111' ? null : '验证码有误或已过期';
//                   },
//                   // onClipboardFound: (value) {
//                   //   debugPrint('onClipboardFound: $value');
//                   //   pinController.setText(value);
//                   // },
//                   hapticFeedbackType: HapticFeedbackType.lightImpact,
//                   // onCompleted: (pin) {
//                   //   debugPrint('onCompleted: $pin');
//                   // },
//                   // onChanged: (value) {
//                   //   debugPrint('onChanged: $value');
//                   // },
//                   cursor: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [Container(margin: const EdgeInsets.only(bottom: 9), width: 22, height: 1, color: focusedBorderColor)],
//                   ),
//                   focusedPinTheme: defaultPinTheme.copyWith(
//                     decoration: defaultPinTheme.decoration!.copyWith(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: focusedBorderColor),
//                     ),
//                   ),
//                   submittedPinTheme: defaultPinTheme.copyWith(
//                     decoration: defaultPinTheme.decoration!.copyWith(
//                       color: fillColor,
//                       borderRadius: BorderRadius.circular(19),
//                       border: Border.all(color: focusedBorderColor),
//                     ),
//                   ),
//                   errorPinTheme: defaultPinTheme.copyBorderWith(border: Border.all(color: Colors.redAccent)),
//                 ),
//                 const SizedBox(height: 10),
//                 Wrap(
//                   crossAxisAlignment: WrapCrossAlignment.center,
//                   children: [
//                     Text(
//                       widget.selectTabIndex == 0 ? '+86 180 6943 6480' : 'eternal0918@163.com',
//                       style: TextStyle(
//                         color: EternalColors.titleColor,
//                         letterSpacing: 2,
//                         fontSize: EternalFontSize.large(),
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "HYZhengYuan",
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Material(
//                       color: Colors.transparent,
//                       clipBehavior: Clip.hardEdge,
//                       borderRadius: const BorderRadius.all(Radius.circular(50)),
//                       child: InkWell(
//                         onTap: () {
//                           // 按钮点击事件
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle, // 设置为圆形
//                               border: Border.all(width: 1, color: Colors.white10)),
//                           child: Icon(Icons.border_color, color: Colors.white, size: EternalIconSize.smallSize),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     // 发送验证码按钮
//                     OutlinedButton(
//                       onPressed: () {},
//                       style: btnStyle,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.ads_click, size: 20),
//                           SizedBox(width: 12),
//                           Text('重新获取', style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular())),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     // 登录按钮
//                     OutlinedButton(
//                       onPressed: () {
//                         EternalNavigatorRoute.pushAndRemoveUntil(context, MyApp());
//                       },
//                       style: btnStyle,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.login, size: 20),
//                           SizedBox(width: 12),
//                           Text('登录', style: TextStyle(fontWeight: FontWeight.bold, fontSize: EternalFontSize.regular())),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
