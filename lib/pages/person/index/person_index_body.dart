import 'package:flutter/material.dart';
import 'package:flutter_04/constants/eternal_margin.dart';
import 'package:flutter_04/constants/eternal_padding.dart';
import 'package:flutter_04/pages/person/index/person_index_attention.dart';
import 'package:flutter_04/pages/person/index/person_index_favorite.dart';
import 'package:flutter_04/pages/person/index/person_index_product.dart';
import 'package:flutter_04/pages/person/index/person_index_side_item.dart';

class PersonIndexBody extends StatefulWidget {
  bool openFlag;

  PersonIndexBody({Key? key, required this.openFlag}) : super(key: key);

  @override
  _PersonIndexBodyState createState() => _PersonIndexBodyState();
}

class _PersonIndexBodyState extends State<PersonIndexBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: EternalPadding.smallPadding,
        top: EternalPadding.defaultPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            width: widget.openFlag ? 100 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCirc,
            decoration: const BoxDecoration(),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                const PersonIndexSideItem(),
                SizedBox(width: EternalMargin.smallMargin),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ///关注的人
                      const SizedBox(height: 120, child: PersonIndexAttention()),
                      SizedBox(height: EternalMargin.defaultMargin),

                      ///我的动态
                      const SizedBox(height: 450, child: PersonIndexProduct()),
                      SizedBox(height: EternalMargin.defaultMargin),

                      ///我的喜欢
                      const SizedBox(height: 450, child: PersonIndexFavorite())
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
