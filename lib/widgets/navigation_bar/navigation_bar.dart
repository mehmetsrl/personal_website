import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navigation_bar_mobile.dart';
import 'navigation_bar_tablet_desktop.dart';

class NavigationBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  const NavigationBar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(_scaffoldKey),
      tablet: NavigationBarMobile(_scaffoldKey),
      desktop: NavigationBarTabletDesktop(),
    );
  }
}
