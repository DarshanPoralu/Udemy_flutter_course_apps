import 'package:bmi_calculator_app/components/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_widget.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.calculatorBrain});

  final CalculatorBrain calculatorBrain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableWidget(
                color: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      calculatorBrain.getResult(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      calculatorBrain.calculateBMI(),
                      style: kBMITextStyle,
                    ),
                    Text(
                      calculatorBrain.getInterpretation(),
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                onPress: () {},
              ),
            ),
            BottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATE',
            ),
          ]),
    );
  }
}
