import 'package:bmicalculator/common/RoundIconButton.dart';
import 'package:bmicalculator/resultPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'common/Gender.dart';
import 'common/IconWidget.dart';
import 'package:flutter/material.dart';
import 'common/ReusableCard.dart';
import 'common/common.dart';
import 'common/bottomButton.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? genderSelect;
  double height = 170.0;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          genderSelect = Gender.MAN;
                        }),
                        child: ReusableCard(
                          onPress: () => setState(() {
                            genderSelect = Gender.MAN;
                          }),
                          cardColor: genderSelect == Gender.MAN
                              ? ACTIVE_CARD_COLOUR
                              : INACTIVE_CARD_COLOUR,
                          childWidget: const IconWidget(
                            icon: FontAwesomeIcons.mars,
                            text: "MAN",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () => setState(() {
                          genderSelect = Gender.WOMAN;
                        }),
                        cardColor: genderSelect == Gender.WOMAN
                            ? ACTIVE_CARD_COLOUR
                            : INACTIVE_CARD_COLOUR,
                        childWidget: const IconWidget(
                          icon: FontAwesomeIcons.venus,
                          text: "WOMAN",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardColor: ACTIVE_CARD_COLOUR,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: CARD_TEXT_STYLE,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toStringAsFixed(1),
                            style: NUMBER_TEXT_STYLE,
                          ),
                          const Text(
                            "cm",
                            style: CARD_TEXT_STYLE,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: Theme.of(context).sliderTheme.copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: const Color(0xFF8F8E98),
                              thumbColor: BOTTOM_CARD_COLOUR,
                              overlayColor: const Color(0x40EB1555),
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0),
                            ),
                        child: Slider(
                          value: height,
                          max: 220.0,
                          min: 100.0,
                          onChanged: (double newHeight) => setState(() {
                            height = newHeight;
                          }),
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
                        cardColor: ACTIVE_CARD_COLOUR,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "WEIGHT",
                              style: CARD_TEXT_STYLE,
                            ),
                            Text(
                              weight.toString(),
                              style: NUMBER_TEXT_STYLE,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
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
                        cardColor: ACTIVE_CARD_COLOUR,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "AGE",
                              style: CARD_TEXT_STYLE,
                            ),
                            Text(
                              age.toString(),
                              style: NUMBER_TEXT_STYLE,
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
                                const SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ButtomButton(
                  text: "CALCULATE",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultPage(weight:weight,height: height)));
                  })
            ],
          ),
        ));
  }
}
