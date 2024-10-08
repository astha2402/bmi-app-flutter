import 'package:bmi_flutter/components/BottomWidget.dart';
import 'package:bmi_flutter/screens/result_page_bmr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconCard.dart';
import '../components/reusable_card.dart';
import '../components/constant.dart';
import '../components/RoundCard.dart';
import 'dart:core';
import 'package:bmi_flutter/calculateBMR_brain.dart';

class InputPageBMR extends StatefulWidget {
  const InputPageBMR({super.key});
  @override
  _InputPageBMRState createState() => _InputPageBMRState();
}

class _InputPageBMRState extends State<InputPageBMR> {
  Gender selectedGender = Gender.notmentioned;
  int height = 180;
  int weight = 60;
  int age = 18;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMR CALCULATOR', style: labelStyle)),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          iconCard(label: 'MALE', ic: FontAwesomeIcons.mars),
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          iconCard(label: 'FEMALE', ic: FontAwesomeIcons.venus),
                        ],
                      )),
                ),
              ])),
              Expanded(
                child: ReusableContainer(
                    colour: reusableContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "HEIGHT",
                          style: labelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: numberStyle),
                            const Text('cm', style: numberStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: Colors.grey[350],
                              overlayColor: Colors.grey,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 30.0)),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              activeColor: Colors.purple[500],
                              inactiveColor: Colors.purple[100],
                              onChanged: (double value) {
                                setState(() {
                                  height = value.toInt();
                                });
                              }),
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: ReusableContainer(
                      colour: reusableContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "WEIGHT",
                            style: labelStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(weight.toString(), style: numberStyle),
                                const Text("kg", style: numberStyle),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                ic: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              RoundButton(
                                ic: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      colour: reusableContainerColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "AGE",
                              style: labelStyle,
                            ),
                            Text(age.toString(), style: numberStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundButton(
                                  ic: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                RoundButton(
                                  ic: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ]),
                    ),
                  )
                ]),
              ),
              ButtonWidget(
                  onTap: () {
                    CalculatebmrBrain calBr = CalculatebmrBrain(
                        gender: selectedGender,
                        height: height,
                        weight: weight,
                        age: age);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPageBMR(
                                  bmr: calBr.calculateBMR(),
                                )));
                  },
                  heightButton: 50.0,
                  buttonLabel: "CALCULATE BMI")
            ]));
  }
}
