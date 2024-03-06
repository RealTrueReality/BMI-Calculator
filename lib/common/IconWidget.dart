import 'package:flutter/material.dart';
import 'common.dart';
class IconWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconWidget({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          text,
          style: CARD_TEXT_STYLE,
        )
      ],
    );
  }
}