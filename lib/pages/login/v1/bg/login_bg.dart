// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../../main.dart';
//
// class LoginBg extends StatefulWidget {
//   const LoginBg({super.key});
//
//   @override
//   State<LoginBg> createState() => _LoginBgState();
// }
//
// class _LoginBgState extends State<LoginBg> with SingleTickerProviderStateMixin {
//   late final WebViewController _controller;
//   double height = 0;
//   late bool _isLoading = true;
//   late AnimationController _animationController;
//   late Animation<double> _opacityAnimation;
//
//   @override
//   void initState() {
//     _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
//     _opacityAnimation = CurvedAnimation(parent: _animationController, curve: const Cubic(1, 0, .4, 1));
//
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(NavigationDelegate(
//         onPageFinished: (String url) {
//           // 页面加载完成时调用
//           setState(() {
//             _isLoading = false; // 更新加载状态
//             _animationController.forward(from: 0);
//           });
//         },
//       ));
//     _controller.loadFlutterAsset("assets/html/loginBg.html");
//     _controller.clearLocalStorage();
//     _controller.clearCache();
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.clearLocalStorage();
//     _controller.clearCache();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           left: 0,
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: WebViewWidget(controller: _controller),
//           ),
//         ), // 如果页面还在加载中，显示加载指示器
//         AnimatedBuilder(
//           animation: _opacityAnimation,
//           builder: (context, child) {
//             // print("动画：${_opacityAnimation.value}");
//             return Opacity(
//               opacity: 1 - _opacityAnimation.value,
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.black,
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
