import 'package:bmi_flutter/Calculator_Brain.dart';
import 'package:bmi_flutter/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Reusable_Card.dart';
import 'constant.dart';

enum Gender {
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double _sliderValue = 170.0;
  int weight = 60;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    colours: selectedGender == Gender.MALE
                        ? inactivateCardColor
                        : activateCardColor,
                    cardChild: sexCard(
                      icons: FontAwesomeIcons.mars,
                      sex: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: IconContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    colours: selectedGender == Gender.FEMALE
                        ? inactivateCardColor
                        : activateCardColor,
                    cardChild: sexCard(
                      icons: FontAwesomeIcons.venus,
                      sex: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IconContainer(
              colours: activateCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _sliderValue.toStringAsFixed(0),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
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
                          min: 100.0,
                          max: 200.0,
                          onChanged: (newRating) {
                            setState(() => _sliderValue = newRating);
                          },
                          value: _sliderValue,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconContainer(
                    colours: activateCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                  print(weight);
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: IconContainer(
                    colours: activateCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                age++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: "CALCULATE",onTap: (){
            CalculatorBrain calcu = CalculatorBrain(height: _sliderValue, weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>ResultPage(
                  bmiResult: calcu.calculteBMI(),
                  resultText: calcu.getResult(),
                  intepretation: calcu.getIntrepertation(),
                ),
              ),
            );
          } ,),
        ],
      ),
    );
  }
}

