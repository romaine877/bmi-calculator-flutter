import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_calculation.dart';
import 'card_content.dart';
import 'constants.dart';
import 'reusable_widget.dart';

enum Gender { male, female }
int height = 100;
int weight = 74;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableWidget(
                  delayAnimation: 200,
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: CardContent(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                )),
                Expanded(
                    child: ReusableWidget(
                  delayAnimation: 400,
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: CardContent(
                    icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableWidget(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Colors.pink,
                      overlayColor: Color(0x29eb1555)),
                  child: Slider(
                      min: 100,
                      max: 200,
                      value: height.toDouble(),
                      //activeColor: Colors.white,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      }),
                ),
              ],
            ),
            delayAnimation: 1000,
            colour: kActiveCardColour,
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableWidget(
                  delayAnimation: 600,
                  colour: kInactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          RoundedButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: ReusableWidget(
                    delayAnimation: 800,
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
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
          BottomButton(
            text: "Calculate",
            onTap: () {
              BmiCalculator calculate =
                  BmiCalculator(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            result: calculate.getResult(),
                            resultText: calculate.getResultText(),
                            narrative: calculate.getInterpretation(),
                          )));
            },
          ),
        ],
      ),
    ));
  }
}

class BottomButton extends StatelessWidget {
  final String text;

  final Function onTap;

  const BottomButton({
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        margin: EdgeInsets.only(top: 10),
        color: Colors.pink,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    this.icon,
    this.onPressed,
  });
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      onPressed: onPressed,
      child: Icon(icon),
      fillColor: kActiveCardColour,
      shape: CircleBorder(),
    );
  }
}
