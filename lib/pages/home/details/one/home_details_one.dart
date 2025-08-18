import 'package:flutter/material.dart';

import 'package:flutter_04/constants/eternal_colors.dart';

import 'package:flutter_04/pages/home/details/one/home_details_remark.dart';
import 'home_details_body_page.dart';

//图片详情页
class HomeDetailsOne extends StatefulWidget {
  const HomeDetailsOne({super.key});

  @override
  State<HomeDetailsOne> createState() => _HomeDetailsOneState();
}

class _HomeDetailsOneState extends State<HomeDetailsOne> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: EternalColors.defaultColor,
      body: HomeDetailsBodyPage(),
      bottomNavigationBar: HomeDetailsRemark(),
    );
  }
}
