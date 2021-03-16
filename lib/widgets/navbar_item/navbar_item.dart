import 'package:flutter/material.dart';
import 'package:personal_website/models/navbar_item_model.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/viewmodels/navbar_item_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navbar_item_desktop.dart';
import 'navbar_item_mobile.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon,
    );
    return ViewModelProvider<NavBarItemViewModel>.withoutConsumer(
          builder: (context , viewmodel , widget ) {  
          return GestureDetector(
            onTap: () {
              viewmodel.onClicked();
              Provider.of<LayoutViewmodel>(context,listen: false).onNavigationDrawerButtonClicked();
            },
            child: Provider.value(
              value: model,
              child: Container(
                // width: navButtonSize.width,
                // height: navButtonSize.height,
                child: ScreenTypeLayout(
                  desktop: NavBarItemTabletDesktop(),
                  tablet: NavBarItemMobile(),
                  mobile: NavBarItemMobile(),
                ),
              )//.showCursorOnHover.moveUpOnHover,
            ),
          );
        }, viewModelBuilder: () { return NavBarItemViewModel(model); },
    );
  }
}
