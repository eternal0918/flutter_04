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

  ButtonStyle btnStyle = OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );

  @override
  Widget build(BuildContext context) {
    return FlutterLogo();
  }
}
