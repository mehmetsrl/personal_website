import 'package:flutter/material.dart';
import 'package:personal_website/constants/componentSizes.dart';
import 'package:personal_website/routing/route_names.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/widgets/navbar_item/navbar_item.dart';
import 'package:provider/provider.dart';

import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              NavBarLogo(
                Provider.of<LayoutViewmodel>(context, listen: false).profilePciturePath,
                profilePictureSize,
              ),
              SizedBox(
                width: 10,
              ),
              NavBarItem(
                  Provider.of<LayoutViewmodel>(context, listen: false)
                          .personalInfo
                          .name +
                      ' ' +
                      Provider.of<LayoutViewmodel>(context, listen: false)
                          .personalInfo
                          .surname,
                  HomeRoute),
            ],
          ),
          SizedBox(
            width: 100,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Home', HomeRoute),
              SizedBox(
                width: navButtonSpaceSize.width,
              ),
              NavBarItem('Timeline', TimelineRoute),
              SizedBox(
                width: navButtonSpaceSize.width,
              ),
              NavBarItem('Portfolio', PortfolioRoute),
              SizedBox(
                width: navButtonSpaceSize.width,
              ),
              NavBarItem('Contact', ContactRoute),
            ],
          )
        ],
      ),
    );
  }
}
