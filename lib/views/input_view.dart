import 'package:bmi_calulator/components/custom_bottom_container.dart';
import 'package:bmi_calulator/components/custom_circular_btn.dart';
import 'package:bmi_calulator/components/icon_content.dart';
import 'package:bmi_calulator/constants/constant_colours.dart';
import 'package:bmi_calulator/constants/font_style_constant.dart';
import 'package:bmi_calulator/constants/theme_constant.dart';
import 'package:bmi_calulator/main.dart';
import 'package:bmi_calulator/view_model/bmi_result_calculator.dart';
import 'package:bmi_calulator/view_model/theme_manager.dart';
import 'package:bmi_calulator/views/result_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/custom_container.dart';

class InputView extends StatefulWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  State<InputView> createState() => _InputViewState();
}

enum Gender { male, female }

class _InputViewState extends State<InputView> {
  int height = 140;
  int weight = 60;
  int age = 22;
  ThemeManager _themeManager = ThemeManager();
  Gender? selectedGender;
  // Color maleontainerColour = inActiveColour;
  // Color femaleContainerColour = inActiveColour;
  // getColor(String gender) {
  //   if (gender == 'male') {
  //     maleontainerColour = activeColour;
  //   } else {
  //     maleontainerColour = inActiveColour;
  //   }
  //   //FEMALE
  //   if (gender == 'female') {
  //     femaleContainerColour = activeColour;
  //   } else {
  //     femaleContainerColour = inActiveColour;
  //   }
  //}

  @override
  void dispose() {
    _themeManager.removeListener(themeChange);
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    _themeManager.addListener(themeChange);
    super.initState();
  }


  themeChange(){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myLightTheme,
      darkTheme: myDarkTheme,
      themeMode: _themeManager.themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calcultor"),
          centerTitle: true,
          actions: [
            Switch(value:_themeManager.themeMode == ThemeMode.dark, onChanged: (newValue){
              _themeManager.changeTheme(newValue);
        }),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: CustomContainer(
                        myColor: selectedGender == Gender.male
                            ? kActiveColour
                            : kInActiveColour,
                        // myColor: inActiveColour,
                        custChild: IconContent(
                          iconData: Icons.male,
                          label: "MALE",
                        ),
                      ),
                    ),
                  ),
                  //container2
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: CustomContainer(
                        myColor: selectedGender == Gender.female
                            ? kActiveColour
                            : kInActiveColour,
                        custChild: IconContent(
                          iconData: Icons.female,
                          label: "FEMALE",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //SLider Implementations
            Expanded(
              child: CustomContainer(
                myColor: kInActiveColour,
                custChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "cm",
                          style: kLabelStyle,
                        ),
                      ],
                    ),

                       Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 180,
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                              print(value);
                            });
                          }),

                  ],
                ),
              ),
            ),
            //Widget3
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      myColor: kInActiveColour,
                      custChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ///TODO: 3RD WIDGT
                          Text(
                            "WEIGHT",
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomCircularBtn(
                                iconData: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              CustomCircularBtn(
                                iconData: Icons.add,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomContainer(
                      myColor: kInActiveColour,
                      custChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomCircularBtn(
                                iconData: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              CustomCircularBtn(
                                iconData: Icons.add,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
           //
            CustomContainerReused(height: height, weight:weight),
          ],
        ),
      ),
    );
  }
}


class CustomContainerReused extends StatelessWidget {
  CustomContainerReused({this.height, this.weight});

  int? height;
  int? weight;
  @override
  Widget build(BuildContext context) {
    return  CustomBottomContainer(
      btnText: "CALCULATE",
      onPress: () {

        print(height);
        BMIResultCalulator bmiCalculate = BMIResultCalulator(
            calculatedHeight: height!, calculatedWeight: weight!);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResultView(
              bmi: bmiCalculate.bmiCalculate(),
              resultText: bmiCalculate.getResultText(),
              interpretation: bmiCalculate.getInterpretation(),
            )));
      },
    );
  }
}