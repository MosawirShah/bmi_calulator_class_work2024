import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants/constant_colours.dart';
import 'views/input_view.dart';



void main(){
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColour,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: kBackgroundColour
      ),
      home: InputView(),
    );
  }
}
