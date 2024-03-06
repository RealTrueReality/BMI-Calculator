import 'package:bmicalculator/common/common.dart';
import 'package:flutter/material.dart';

import '../resultPage.dart';

class ButtomButton extends StatelessWidget {
  const ButtomButton({super.key, required this.text,required this.onTap});

  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: BOTTOM_CARD_COLOUR,
        margin: const EdgeInsets.only(top: 15.0),
        height: 60.0,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
