import 'dart:math';
import 'package:bmi_calulator/views/input_view.dart';

class BMIResultCalulator{
  //Gender selectedGender;
  int calculatedHeight;
  int calculatedWeight;
  double? _bmi;

  BMIResultCalulator({ required this.calculatedHeight, required this.calculatedWeight});

  String bmiCalculate(){
    _bmi = calculatedWeight /pow(calculatedHeight/100, 2);
    return _bmi!.toStringAsFixed(1);
  }
  String getResultText(){
  if(_bmi!=null){
    if(_bmi! >= 25){
      return 'OVERWEIGHT';
    }else if(_bmi!>18){
      return 'NORMAL';
    }else{
      return 'Underweight';
    }
  }else{
    _bmi = 23.3;
    return 'unknown Value';
  }

  }

  String getInterpretation(){
    if(_bmi! >= 25){
      return 'You have a higher than normal body weight. Try to exercise more';
    }else if(_bmi!>18){
      return 'You have a normal body weight. Good job!';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}