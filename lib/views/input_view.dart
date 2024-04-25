import 'package:bmi_calulator/components/custom_circular_btn.dart';
import 'package:bmi_calulator/components/icon_content.dart';
import 'package:bmi_calulator/constants/constant_colours.dart';
import 'package:bmi_calulator/constants/font_style_constant.dart';
import 'package:bmi_calulator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/custom_container.dart';

class InputView extends StatefulWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  State<InputView> createState() => _InputViewState();
}


enum Gender {male, female}

class _InputViewState extends State<InputView> {
  int height = 120;
  int weight = 60;
  int age = 22;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calcultor"),
        centerTitle: true,
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
                      myColor: selectedGender == Gender.male ? kActiveColour : kInActiveColour,
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
                      myColor: selectedGender == Gender.female ? kActiveColour : kInActiveColour,
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
                      const SizedBox(width: 5,),
                       Text(
                        "cm",
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kPinkColor,
                      overlayColor: kContentColour,
                      inactiveTrackColor: kContentColour,
                      thumbColor: kPinkColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 16
                      ),

                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 180,
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                            print(value);
                          });
                        }),
                  ),
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
                         Text("WEIGHT", style:kLabelStyle,),
                        Text(weight.toString(),style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          CustomCircularBtn(
                           iconData: Icons.remove,
                            onPress: (){
                            setState(() {
                              weight--;
                            });
                            },
                          ),
                          CustomCircularBtn(iconData: Icons.add,onPress: (){
                            setState(() {
                              weight++;
                            });
                          },)
                        ],),
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
                      Text("AGE",style: kLabelStyle,),
                      Text(age.toString(), style: kNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CustomCircularBtn(iconData: Icons.remove, onPress: (){
                          setState(() {
                            age--;
                          });
                        },),
                        CustomCircularBtn(iconData: Icons.add, onPress: (){
                          setState(() {
                            age++;
                          });
                        },),
                      ],)
                    ],),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            color: kPinkColor,
            child: const Center(
                child: Text(
              "Calculate",
              style: TextStyle(
                  color: kContentColour,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
