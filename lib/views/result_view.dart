import 'package:bmi_calulator/components/custom_bottom_container.dart';
import 'package:bmi_calulator/constants/constant_colours.dart';
import 'package:bmi_calulator/constants/font_style_constant.dart';
import 'package:bmi_calulator/views/input_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultView extends StatelessWidget {
  ResultView({required this.resultText, required this.bmi, required this.interpretation});


  String resultText;
  String bmi;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "BMI Calculator",
          style: kAppBarStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "Your Result",
              style: kNumberStyle.copyWith(fontSize: 32),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      resultText,
                      style: kResultText,
                    ),
                    Text(
                      bmi.toString(),
                      style: kResultNumberStyle.copyWith(fontSize: 70,fontWeight: FontWeight.bold),
                    ),
                    Text(
                     interpretation,
                      style: kLabelStyle.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomBottomContainer(btnText: "RE_CALCULATE", onPress: (){
            Navigator.of(context).pop();
            },),
        ],
      ),
    );
  }
}
