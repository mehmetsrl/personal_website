

import 'package:flutter/material.dart';
import 'package:personal_website/constants/app_colors.dart';

class WebButtonMobile extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  const WebButtonMobile(this.title,this.color,this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
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
