import 'package:flutter/material.dart';

import 'one/home_details_one.dart';
import 'one/home_details_tags.dart';
import 'two/home_details_two.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        HomeDetailsOne(),
        HomeDetailsTwo(),


      ],
    );
  }
}
