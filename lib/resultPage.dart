import 'package:bmicalculator/common/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/common/common.dart';
import 'package:bmicalculator/common/bottomButton.dart';

import 'InputPage.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.weight, required this.height});

  final int weight;
  final double height;

  double getBMI(int weight, double height) {
    double actualHeight = height / 100;
    return weight / (actualHeight * actualHeight);
  }

  String getSuggestion(double BMI) {
    if (BMI < 18.5) {
      return "Focus on maintaining a balanced diet and regular exercise to improve your overall health and well-being.";
    } else if (BMI <= 23.9) {
      return "Congratulations on maintaining a healthy BMI! Remember to exercise regularly.";
    } else if (BMI <= 27.9) {
      return "Try incorporating more fruits and vegetables into your diet, and aim to exercise for at least 30 minutes a day.";
    } else {
      return "Take action to reduce your BMI as soon as possible. Talk to your doctor about developing a weight loss";
    }
  }

  String getResult(double BMI) {
    if (BMI < 18.5) {
      return "UNDER-WEIGHT";
    } else if (BMI <= 23.9) {
      return "NORMAL";
    } else if (BMI <= 27.9) {
      return "OVER-WEIGHT";
    } else {
      return "OBESE";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: TITLE_TEXT_STYLE,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              cardColor: ACTIVE_CARD_COLOUR,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getResult(getBMI(weight, height)),
                    style: RESULT_TEXT_STYLE,
                  ),
                  Text(
                    getBMI(weight, height).toStringAsFixed(1),
                    style: BMI_TEXT_STYLE,
                  ),
                  Text(
                    getSuggestion(getBMI(weight, height)),
                    style: SUGGESTION_TEXT_STYLE,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ButtomButton(
                text: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                }),
          )
        ],
      ),
    );
  }
}
