import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.result, this.resultText, this.narrative});
  final String resultText;
  final String result;
  final String narrative;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
                child: Text(
              "Your Results:",
              style: kTitleTextStyle,
            )),
          ),
          Expanded(
              // flex: 5,
              child: ReusableWidget(
            delayAnimation: 100,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resultText,
                  style: kResultTextStyle,
                ),
                Text(
                  result,
                  style: kBMITextStyle,
                ),
                Text(
                  narrative,
                  style: kBodyTextStyle,
                )
              ],
            ),
            colour: kActiveCardColour,
          )),
          BottomButton(
            text: "Re-Calculate",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
