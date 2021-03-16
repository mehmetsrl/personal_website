import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'web_button_tablet_desktop.dart';
import 'web_button_mobile.dart';

class WebButton extends StatelessWidget {
  final Function onClick;
  final String title;
  final Color color;
  final Color textColor;
  WebButton(this.title,
      {this.onClick,
      this.color = Colors.lime,
      this.textColor = Colors.white70});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: ScreenTypeLayout(
        mobile: WebButtonMobile(title, color, textColor),
        tablet: WebButtonTabletDesktop(title, color, textColor),
      ),
    ); //.showCursorOnHover.moveUpOnHover;
  }
}
