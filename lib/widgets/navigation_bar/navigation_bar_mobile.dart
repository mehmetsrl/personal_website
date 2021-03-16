import 'package:flutter/material.dart';
import 'package:personal_website/constants/componentSizes.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:provider/provider.dart';

import 'navbar_logo.dart';

class NavigationBarMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  const NavigationBarMobile(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    LayoutViewmodel layoutModel =
        Provider.of<LayoutViewmodel>(context, listen: true);
        
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            // onPressed: () => _scaffoldKey.currentState.openDrawer(),//layoutModel.onNavigationDrawerOpenButtonClicked(),
            onPressed: () => layoutModel.onNavigationDrawerOpenButtonClicked(),
          ),
          NavBarLogo(layoutModel.profilePciturePath, profilePictureSize),
        ],
      ),
    );
  }
}
