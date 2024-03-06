import 'package:flutter/material.dart';
import 'InputPage.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme:
          ThemeData().
          colorScheme.
          copyWith(
                primary: const Color(0xFF0A0E21),
              ),
          scaffoldBackgroundColor: const Color(0xFF0A0E21)),
      home: const InputPage(),
    );
  }
}
