

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Icon_content.dart';
import 'package:bmi_calculator/Reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'Bottom_button.dart';
import 'round_icon_buttons.dart';
import 'calculator_brain.dart';


enum GenderType{
  Male,
  Female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType selectedGender;

  int height=180;
  int weight=50;
  int age=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Expanded(child: Row(
          children: <Widget>[
            Expanded(child: Reusable(
              onPress: (){
                setState(() {
                  selectedGender=GenderType.Male;
                });
                },
              colour: selectedGender == GenderType.Male ? kActiveCardColour : kInactiveCardColour,
              cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
            ),),
            Expanded(child: Reusable(
              onPress: (){
                setState(() {
                  selectedGender=GenderType.Female;
                });
              },
              colour: selectedGender == GenderType.Female ? kActiveCardColour : kInactiveCardColour,
              cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
            ),),
          ],
        ),),
        Expanded(child: Reusable(
          colour: kInactiveCardColour,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('HEIGHT',style: kLabelStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(height.toString(),style: kCardStyle),
                  Text('cm',style: kLabelStyle),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Color(0xFFFFFFFF),
                  overlayColor: Color(0x25EB1555),
                  thumbColor: Color(0xFFEB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                    value: height.toDouble() ,
                    min: 120,
                    max: 220,
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    },
                ),
              ),
            ],
          ),
        ),),
        Expanded(child: Row(
          children: <Widget>[
            Expanded(child: Reusable(
              colour:kInactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weight', style: kLabelStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kCardStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundButtonIcon(
                          icon: FontAwesomeIcons.minus,
                         onPressed: (){
                               setState(() {
                                weight--;
                           });
                        },
                      ),
                      SizedBox(width: 10.0,),
                      RoundButtonIcon(
                        icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },)
                    ],
                  )
                ],
              ),
            ),),
            Expanded(child: Reusable(
              colour:kInactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'AGE', style: kLabelStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kCardStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundButtonIcon(
                          icon: FontAwesomeIcons.minus,
                      onPressed: (){
                            setState(() {
                              age--;
                            });
                      },),
                      SizedBox(width: 10.0,),
                      RoundButtonIcon(
                        icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },)
                    ],
                  )
                ],
              ),
            ),),
          ],
        )),
        BottomButton(
          buttonTitle: 'CALCULATE',
          onTap:  (){

            CalculatorBrain brain= CalculatorBrain(height: height,weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
                bmiResult:brain.calculateBMI(),
                resultText: brain.getResult(),
              interpretation: brain.getInterpretation(),
            ),),);
          },
        ),
        ],
      ),
    );
  }
}








