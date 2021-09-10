import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_content.dart';
import '../components/reusable_widget.dart';
import '../components/constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 50;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                      color: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: ReusableContent(
                        FontAwesomeIcons.mars,
                        Text(
                          'MALE',
                          style: kTextStyle,
                        ),
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }),
                ),
                Expanded(
                  child: ReusableWidget(
                      color: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: ReusableContent(
                        FontAwesomeIcons.mars,
                        Text(
                          'FEMALE',
                          style: kTextStyle,
                        ),
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              'cm',
                              style: kTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              }),
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPress: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(height: this.height, weight: this.weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(calculatorBrain: calculatorBrain)),
              );
            },
            text: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPress});

  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

