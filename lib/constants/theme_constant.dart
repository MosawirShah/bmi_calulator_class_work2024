import 'package:bmi_calulator/constants/constant_colours.dart';
import 'package:flutter/material.dart';

//LIGHT
ThemeData myLightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: kGreenColor,
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.green[100],
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(kGreenColor),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: kGreenColor,
    overlayColor: kContentColour,
    inactiveTrackColor: kContentColour,
    thumbColor: kGreenColor,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
  ),
);

//Dark theme
ThemeData myDarkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: kPinkColor,
    foregroundColor: Colors.white,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(kPinkColor),
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: kPinkColor,
    overlayColor: kContentColour,
    inactiveTrackColor: kContentColour,
    thumbColor: kPinkColor,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
  ),
);
