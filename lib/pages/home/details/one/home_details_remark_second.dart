import 'package:flutter/material.dart';
import 'package:flutter_04/components/eternal_key_board_height.dart';
import 'package:flutter_04/constants/eternal_colors.dart';
import 'package:flutter_04/constants/eternal_constants.dart';

class HomeDetailsRemarkSecond extends StatefulWidget {
  const HomeDetailsRemarkSecond({Key? key}) : super(key: key);

  @override
  _HomeDetailsRemarkSecondState createState() => _HomeDetailsRemarkSecondState();
}

class _HomeDetailsRemarkSecondState extends State<HomeDetailsRemarkSecond>
    with WidgetsBindingObserver, EternalKeyboardHeight {
  double bottom = 0;
  bool bottomFlag = true;

  @override
  void keyboardHeight(double height) {
    super.keyboardHeight(height);
    bottom = height;
    bottom > 100 ? bottomFlag = true : bottomFlag = false;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(backgroundImage: NetworkImage(EternalConstants.randomImageUrl), radius: 25),
        ),
        Expanded(
          flex: 5,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: EternalColors.boxDefaultColor,
                shape: StadiumBorder(),
                elevation: 0,
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: EternalColors.defaultColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.only(bottom: bottomFlag ? bottom : 0),
                      width: double.infinity,
                      child: TextField(),
                    );
                  },
                );
              },
              child: RemarkSecondButton()),
        )
      ],
    );
  }
}

class RemarkSecondButton extends StatefulWidget {
  const RemarkSecondButton({super.key});

  @override
  State<RemarkSecondButton> createState() => _RemarkSecondButtonState();
}

class _RemarkSecondButtonState extends State<RemarkSecondButton> with WidgetsBindingObserver, EternalKeyboardHeight {
  double bottom = 0;
  bool bottomFlag = true;

  @override
  void keyboardHeight(double height) {
    super.keyboardHeight(height);
    bottom = height;
    bottom > 100 ? bottomFlag = true : bottomFlag = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "来说点什么吧 . . .",
          style: TextStyle(color: EternalColors.selectColor, fontSize: 15),
        ),
        Wrap(
          spacing: 0,
          children: [
            IconButton(
              icon: Icon(Icons.alternate_email_rounded, color: EternalColors.selectColor),
              splashRadius: 20,
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: EternalColors.defaultColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.only(bottom: bottomFlag ? bottom : 0),
                        width: double.infinity,
                        child: TextField(),
                      );
                    });
              },
            ),
            IconButton(
              icon: Icon(Icons.mood_rounded, color: EternalColors.selectColor),
              splashRadius: 20,
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: EternalColors.defaultColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.only(bottom: bottomFlag ? bottom : 0),
                        width: double.infinity,
                        child: TextField(),
                      );
                    });
              },
            ),
            IconButton(
              icon: Icon(Icons.image_rounded, color: EternalColors.selectColor),
              splashRadius: 20,
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: EternalColors.defaultColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.only(bottom: bottomFlag ? bottom : 0),
                        width: double.infinity,
                        child: TextField(),
                      );
                    });
              },
            )
          ],
        )
      ],
    );
  }
}
