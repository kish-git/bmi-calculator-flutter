import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else
        maleCardColor = inactiveCardColor;
    }
    if (gender == 2) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else
        femaleCardColor = inactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: ReusableContainer(
                          colour: maleCardColor,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars,
                            label: "MALE",
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReusableContainer(
                          colour: femaleCardColor,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.venus,
                            label: "FEMALE",
                          )),
                    ),
                  ),
                ],
              )),
              Expanded(
                child: ReusableContainer(
                  colour: activeCardColor,
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      colour: activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      colour: activeCardColor,
                    ),
                  ),
                ],
              )),
              Container(
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: bottomContainerHeight,
              )
            ],
          ),
        ));
  }
}
