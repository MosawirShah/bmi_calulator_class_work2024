import 'package:bmi_calulator/components/icon_content.dart';
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

class _InputViewState extends State<InputView> {
  int height = 120;

  Color maleontainerColour = inActiveColour;
  Color femaleContainerColour = inActiveColour;
  getColor(String gender) {
    if (gender == 'male') {
      maleontainerColour = activeColour;
    } else {
      maleontainerColour = inActiveColour;
    }
    //FEMALE
    if (gender == 'female') {
      femaleContainerColour = activeColour;
    } else {
      femaleContainerColour = inActiveColour;
    }
  }

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
                        getColor('male');
                      });
                    },
                    child: CustomContainer(
                      myColor: maleontainerColour,
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
                        getColor('female');
                      });
                    },
                    child: CustomContainer(
                      myColor: femaleContainerColour,
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
              myColor: inActiveColour,
              custChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 20, color: contentColour),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          color: contentColour,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text(
                        "cm",
                        style: TextStyle(color: contentColour, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 180,
                      activeColor: activeColour,
                      inactiveColor: contentColour,
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
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
                    myColor: inActiveColour,
                  ),
                ),
                Expanded(
                  child: CustomContainer(
                    myColor: inActiveColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            color: inActiveColour,
            child: Center(
                child: Text(
              "Calculate",
              style: TextStyle(
                  color: contentColour,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
