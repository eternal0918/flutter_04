import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/eternal_route_direct.dart';

//自定义路由动画
class EternalNavigatorRoute {
  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(createRoute(Tween(begin: const Offset(0.0, 1.0), end: Offset.zero), page));
  }

  static void pushByDirect({required BuildContext context, required Widget page, String direct = EternalRouteDirect.bottomToTop}) {
    Tween<Offset> tween;
    switch (direct) {
      case EternalRouteDirect.bottomToTop:
        tween = EternalRouteDirect.btt;
        break;
      case EternalRouteDirect.topToBottom:
        tween = EternalRouteDirect.ttb;
        break;
      case EternalRouteDirect.leftToRight:
        tween = EternalRouteDirect.ltr;
        break;
      case EternalRouteDirect.rightToLeft:
        tween = EternalRouteDirect.rtl;
        break;
      default:
        tween = EternalRouteDirect.btt;
        break;
    }
    Navigator.of(context).push(createRoute(tween, page));
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(context, createRoute(Tween(begin: const Offset(0.0, 1.0), end: Offset.zero), page));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(context, createRoute(Tween(begin: const Offset(0.0, 1.0), end: Offset.zero), page), (route) => false);
  }

  static Route createRoute(Tween<Offset> tween, Widget page) {
    return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            // Cubic(1, 0.5, 0, 1.0)
            //   Curves.easeInOutQuint

            position: animation.drive(tween.chain(CurveTween(
              // curve: const Cubic(0.00, 0.95, 0.35, 1.00),
              //   0, 1, 0.2, 1
              // curve: const Cubic(0.00, 0.80, 0.34, 1.00), 400ms
              curve: const Cubic(0, 1, 0.2, 1),
            ))),
            child: child,
          );
        });
  }
}
