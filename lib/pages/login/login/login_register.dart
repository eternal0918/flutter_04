// import 'dart:ui';
//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_04/constants/eternal_colors.dart';
// import 'package:flutter_04/constants/eternal_font_size.dart';
// import 'package:flutter_04/constants/eternal_icon_size.dart';
// import 'package:flutter_04/pages/login/login_page.dart';
// import 'package:glass_kit/glass_kit.dart';
// import 'package:simple_shadow/simple_shadow.dart';
//
// import '../../../base/eternal_navigator_route.dart';
// import '../../../constants/eternal_margin.dart';
// import '../../../constants/eternal_padding.dart';
// import '../bg/login_bg.dart';
//
// class LoginRegister extends StatefulWidget {
//   LoginRegister({super.key});
//
//   @override
//   State<LoginRegister> createState() => _LoginRegisterState();
// }
//
// class _LoginRegisterState extends State<LoginRegister> {
//   final TextEditingController _actController = TextEditingController();
//   final TextEditingController _verifyController = TextEditingController();
//   final FocusNode _actFocusNode = FocusNode();
//   final FocusNode _verifyFocusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     // 在初始化时设置默认值
//     _actController.text = '18069436480';
//   }
//
//   @override
//   void dispose() {
//     _actController.dispose();
//     _verifyController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       resizeToAvoidBottomInset: false, //输入法不会顶起页面
//       body: Stack(
//         children: [
//           SizedBox(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width),
//           Positioned(left: 0, top: 0, child: LoginBg(heightRate: 0.5)),
//           Positioned(
//             top: 0,
//             left: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   // 渐变方向，从左到右
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Colors.transparent,
//                     Colors.transparent,
//                     Colors.transparent,
//                     Colors.black38,
//                     Colors.black,
//                     Colors.black,
//                   ],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.1),
//
//                   /// logo
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: EternalPadding.defaultPadding),
//                     child: Wrap(
//                       runAlignment: WrapAlignment.center,
//                       crossAxisAlignment: WrapCrossAlignment.center,
//                       children: [
//                         Image.asset('assets/images/logo/logo.png', width: 50),
//                         SizedBox(width: EternalMargin.normalMargin),
//                         const Text(
//                           'Sisyphus ai',
//                           style: TextStyle(
//                             fontSize: 50,
//                             color: EternalColors.titleColor,
//                             fontFamily: "Videopac",
//                             letterSpacing: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.2),
//
//                   ///注册
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(30),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: EternalPadding.mainLargePadding),
//                         color: Colors.black.withOpacity(0.2),
//                         height: 300,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: EternalMargin.mainLargeMargin),
//                             Container(
//                               padding: EdgeInsets.fromLTRB(EternalPadding.miniPadding, 0, 0, 0),
//                               child: Text("注册您的账号", style: TextStyle(fontSize: EternalFontSize.mainLarge(), letterSpacing: 1.5)),
//                             ),
//                             SizedBox(height: EternalMargin.largeMargin),
//
//                             ///账号
//                             TextField(
//                               controller: _actController,
//                               focusNode: _actFocusNode,
//                               style: TextStyle(fontSize: EternalFontSize.regular(), letterSpacing: 4, fontWeight: FontWeight.bold),
//                               decoration: const InputDecoration(
//                                 label: Text("手机号/邮箱"),
//                                 floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//                                 floatingLabelAlignment: FloatingLabelAlignment.start,
//                                 filled: true,
//                                 fillColor: Color.fromRGBO(255, 255, 255, 0.05),
//                                 contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                                   borderSide: BorderSide(color: Colors.white12),
//                                 ),
//                               ),
//                               keyboardType: TextInputType.text,
//                               onChanged: (value) {},
//                             ),
//                             SizedBox(height: EternalMargin.defaultMargin),
//
//                             Row(
//                               children: [
//                                 Expanded(
//                                     flex: 1,
//                                     child: TextField(
//                                       controller: _verifyController,
//                                       focusNode: _verifyFocusNode,
//                                       style: TextStyle(fontSize: EternalFontSize.regular(), letterSpacing: 4),
//                                       decoration: const InputDecoration(
//                                         label: Text("验证码"),
//                                         floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//                                         floatingLabelAlignment: FloatingLabelAlignment.start,
//                                         filled: true,
//                                         fillColor: Color.fromRGBO(255, 255, 255, 0.05),
//                                         contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                                           borderSide: BorderSide(color: Colors.white12),
//                                         ),
//                                       ),
//                                       keyboardType: TextInputType.number,
//                                       onChanged: (value) {},
//                                     )),
//                                 SizedBox(
//                                   width: EternalMargin.smallMargin,
//                                 ),
//
//                                 ///获取验证码按钮
//                                 OutlinedButton(
//                                   onPressed: () {},
//                                   style: OutlinedButton.styleFrom(
//                                     padding: EdgeInsets.zero,
//                                     minimumSize: const Size(80, 50),
//                                     backgroundColor: const Color.fromRGBO(19, 19, 19, 1.0),
//                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
//                                     side: const BorderSide(color: Colors.transparent),
//                                   ),
//                                   child: Text(
//                                     "获取",
//                                     style: TextStyle(
//                                       fontSize: EternalFontSize.regular(),
//                                       letterSpacing: 2,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(height: EternalMargin.defaultMargin),
//
//                             ///注册按钮
//                             OutlinedButton(
//                               onPressed: () {
//                                 // 注册逻辑
//                               },
//                               style: OutlinedButton.styleFrom(
//                                 minimumSize: Size(double.infinity, 50),
//                                 padding: EdgeInsets.zero,
//                                 backgroundColor: const Color.fromRGBO(19, 19, 19, 1.0),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
//                                 side: const BorderSide(color: Colors.transparent),
//                               ),
//                               child: Text(
//                                 "注册",
//                                 style: TextStyle(
//                                   fontSize: EternalFontSize.medium(),
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 2,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//
//           ///登录按钮
//           Positioned(
//             bottom: 20,
//             left: 0,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: 50,
//               child: Center(
//                 child: Container(
//                   clipBehavior: Clip.hardEdge,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     gradient: const LinearGradient(
//                       // 渐变方向，从左到右
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Colors.white30,
//                         Colors.black,
//                       ],
//                     ),
//                   ),
//                   child: OutlinedButton(
//                     onPressed: () {
//                       EternalNavigatorRoute.pop(context);
//                     },
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                       side: BorderSide.none,
//                     ),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
//                       child: Wrap(
//                         crossAxisAlignment: WrapCrossAlignment.center,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               style: TextStyle(color: EternalColors.textColor, fontSize: EternalFontSize.base(), letterSpacing: 1),
//                               children: const [
//                                 TextSpan(text: '已有帐号?  '),
//                                 TextSpan(text: '去登录', style: TextStyle(color: EternalColors.titleColor, fontWeight: FontWeight.bold)),
//                               ],
//                             ),
//                           ),
//                           Icon(Icons.arrow_right, size: EternalIconSize.defaultSize, color: EternalColors.titleColor)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           WillPopScope(
//             onWillPop: () async {
//               EternalNavigatorRoute.pop(context);
//               return true;
//             },
//             child: const SizedBox(),
//           )
//         ],
//       ),
//     );
//   }
// }
