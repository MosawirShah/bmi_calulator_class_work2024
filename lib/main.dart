import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views/input_view.dart';

const Color backgroundColour = Color(0xFF0E0921);
// const Color inActiveColour = Color(0xFF111328);
const Color inActiveColour = Color(0xFFE51E60);
Color activeColour = Colors.amber;

const Color contentColour = Color(0xFFFBFBFB);

void main(){
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColour,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: backgroundColour
      ),
      home: InputView(),
    );
  }
}
