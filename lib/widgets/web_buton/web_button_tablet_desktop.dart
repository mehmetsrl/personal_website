import 'package:flutter/material.dart';
import 'package:personal_website/constants/app_colors.dart';

class WebButtonTabletDesktop extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  const WebButtonTabletDesktop(this.title, this.color, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
