import 'package:bmi_test/calculator_brain.dart';
import 'package:bmi_test/results_page.dart';
import 'package:bmi_test/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'upper_content.dart';

const Color deactiveCardColor = Color(0xFF282B4E);
const Color inactiveCardColor = Color(0xFF282B9E);
const kTextBig = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
int pointer = 180;
int weight = 20;
int age = 20;

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color male = deactiveCardColor;
  Color female = deactiveCardColor;

  void updateColor(GenderType gender) {
    if (gender == GenderType.male) {
      if (male == deactiveCardColor) {
        male = inactiveCardColor;
      } else {
        male = deactiveCardColor;
      }
    }

    if (gender == GenderType.female) {
      if (female == deactiveCardColor) {
        female = inactiveCardColor;
      } else {
        female = deactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(GenderType.male);
                        female = deactiveCardColor;
                      });
                    },
                    child: ReusableCard(
                      male,
                      UpperContent(FontAwesomeIcons.male, "Male"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          updateColor(GenderType.female);
                          male = deactiveCardColor;
                        },
                      );
                    },
                    child: ReusableCard(
                      female,
                      UpperContent(FontAwesomeIcons.female, "Female"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              deactiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 18, color: Colors.cyanAccent),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        pointer.toString(),
                        style: kTextBig,
                      ),
                      Text(
                        'cm',
                        style:
                            TextStyle(fontSize: 18, color: Colors.cyanAccent),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: Color(0x2918FFFF)),
                    child: Slider(
                      value: pointer.toDouble(),
                      min: 100,
                      max: 200,
                      onChanged: (value) {
                        setState(
                          () {
                            pointer = value.toInt();
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    deactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.cyanAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextBig,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconbutton(
                              iconData: Icons.add,
                              function: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconbutton(
                              iconData: Icons.remove,
                              function: () {
                                setState(() {
                                  weight--;
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
                  child: ReusableCard(
                    deactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Age",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.cyanAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          age.toString(),
                          style: kTextBig,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconbutton(
                              iconData: Icons.add,
                              function: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconbutton(
                              iconData: Icons.remove,
                              function: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
              CalculatorBrain calc = CalculatorBrain(pointer, weight);
                String result = calc.bmiResult();
                String status = calc.bmiStatus();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(result,status);
                    },
                  ),
                );
              });
            },
            child: Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Center(
                    child: Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 50,
                color: Colors.pink),
          )
        ],
      ),
    );
  }
}

class RoundIconbutton extends StatelessWidget {
  IconData iconData;
  Function function;

  RoundIconbutton({this.iconData, this.function});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      child: Icon(iconData),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      fillColor: Colors.blue,
      constraints: BoxConstraints(minWidth: 50.0, minHeight: 50.0),
    );
  }
}
