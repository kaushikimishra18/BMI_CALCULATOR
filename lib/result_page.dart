
import 'package:bmi_calculator/Reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Bottom_button.dart';



class ResultPage extends StatelessWidget {

ResultPage({@required this.resultText,@required this.bmiResult,@required this.interpretation});

  final String resultText;
  final String bmiResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Text('YOUR RESULT',
                style:kTitleTextStyle ,),
              ),
            ),
          ),
          Expanded(
              flex:5,
            child: Reusable(
              colour: kActiveCardColour,
              cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resultText.toUpperCase(),
                style: kResultTextStyle,
                ),
                Text(
                  bmiResult,
                  style: kBMITextStyle,
                ),
                Text(
                    interpretation,
                style: kBodyTextStyle,
                textAlign: TextAlign.center),
               ],
              ),
            ),
          ),
          BottomButton(
            onTap:  (){
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}

