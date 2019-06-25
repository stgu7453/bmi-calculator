import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_text.dart';
import '../constants.dart';
import '../components/control_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'result_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender activeGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        activeGender = Gender.male;
                      });
                    },
                    colour: activeGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconText(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        activeGender = Gender.female;
                      });
                    },
                    colour: activeGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconText(
                      text: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBoldStyle,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: kCentimeterPadding),
                        child: Text(
                          "cm",
                          style: kTextStyle,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x35EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinimumSize,
                      max: kMaximumSize,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("WEIGHT", style: kTextStyle),
                      Text(
                        weight.toString(),
                        style: kBoldStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ControlButton(
                            heroTag: 'btn1',
                            text: "-",
                            onPress: () {
                              setState(() {
                                weight = weight > 30 ? weight - 1 : weight;
                              });
                            },
                          ),
                          ControlButton(
                            heroTag: 'btn2',
                            text: "+",
                            onPress: () {
                              setState(() {
                                weight = weight < 300 ? weight + 1 : weight;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBoldStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ControlButton(
                            heroTag: 'btn3',
                            text: "-",
                            onPress: () {
                              setState(() {
                                age = age > 1 ? age - 1 : age;
                              });
                            },
                          ),
                          ControlButton(
                              heroTag: 'btn4',
                              text: "+",
                              onPress: () {
                                setState(() {
                                  age = age < 120 ? age + 1 : age;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          BottomButton(
            title: 'Calculate BMII',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
