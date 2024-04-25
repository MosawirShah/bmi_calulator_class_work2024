import 'package:bmi_calulator/constants/constant_colours.dart';
import 'package:bmi_calulator/constants/font_style_constant.dart';
import 'package:bmi_calulator/main.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  IconContent({required this.iconData, required this.label});
  IconData iconData;
  String label;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: kContentColour,
          size: 70,
        ),
       const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: kLabelStyle,
        )
      ],
    );
  }
}
