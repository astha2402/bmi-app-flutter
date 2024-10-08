import 'package:bmi_flutter/calories.dart';
import 'package:bmi_flutter/components/BottomWidget.dart';
import 'package:bmi_flutter/components/constant.dart';
import 'package:bmi_flutter/components/iconCard.dart';
import 'package:bmi_flutter/components/reusable_card.dart';
import 'package:bmi_flutter/screens/result_page_cal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivitySelection extends StatefulWidget {
  const ActivitySelection({super.key});

  @override
  State<ActivitySelection> createState() => _ActivitySelectionState();
}

class _ActivitySelectionState extends State<ActivitySelection> {
  Activity personActive = Activity.notmentioned;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('CALORIES CALCULATOR', style: labelStyle)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          personActive = Activity.sedentary;
                        });
                      },
                      colour: personActive == Activity.sedentary
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: iconCard(
                          ic: FontAwesomeIcons.person, label: 'SEDENTARY')),
                ),
                Expanded(
                  child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          personActive = Activity.lightActive;
                        });
                      },
                      colour: personActive == Activity.lightActive
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: iconCard(
                          ic: FontAwesomeIcons.personWalking,
                          label: 'LIGHTY ACTIVE')),
                )
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          personActive = Activity.moderateActive;
                        });
                      },
                      colour: personActive == Activity.moderateActive
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: iconCard(
                          ic: FontAwesomeIcons.personRunning,
                          label: 'MODERATELY ACTIVE')),
                ),
                Expanded(
                  child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          personActive = Activity.heavyActive;
                        });
                      },
                      colour: personActive == Activity.heavyActive
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: iconCard(
                          ic: FontAwesomeIcons.personSwimming,
                          label: 'HEAVILY ACTIVE')),
                )
              ],
            )),
            Row(children: <Widget>[
              Expanded(
                child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        personActive = Activity.superActive;
                      });
                    },
                    colour: personActive == Activity.superActive
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: iconCard(
                        ic: FontAwesomeIcons.personDigging,
                        label: 'SUPER ACTIVE')),
              )
            ]),
            ButtonWidget(
                onTap: () {
                  CalculateCalories calBr =
                      CalculateCalories(activity: personActive);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPageCal(
                                calorie: calBr.caloriesConsume(),
                              )));
                },
                heightButton: 50.0,
                buttonLabel: "CALCULATE CALORIES")
          ],
        ));
  }
}
