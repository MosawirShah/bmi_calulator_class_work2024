import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
  CustomContainer({required this.myColor, this.custChild});
  Color myColor;
  Widget? custChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: custChild,
    );
  }
}
