import 'package:bmi_calulator/constants/constant_colours.dart';
import 'package:bmi_calulator/constants/font_style_constant.dart';
import 'package:flutter/material.dart';

class CustomBottomContainer extends StatelessWidget {
  CustomBottomContainer({required this.btnText,required this.onPress});

  String btnText;
  void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Container(
        height: 80,
        width: double.infinity,
        color: kPinkColor,
        child: Center(
            child: Text(
              btnText,
              style: kBottomContainerFontStyle,
            )),
      ),
    );
  }
}
