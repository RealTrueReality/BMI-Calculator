import 'package:flutter/material.dart';
import 'IconWidget.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget? childWidget;
  final Function()? onPress;
  const ReusableCard({super.key, required this.cardColor, this.childWidget,this.onPress});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10.0)),
        child: childWidget,
      ),
    );
  }
}
