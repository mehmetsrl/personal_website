import 'package:flutter/material.dart';
import 'package:personal_website/routing/route_names.dart';
import 'package:personal_website/widgets/navbar_item/navbar_item.dart';
import 'navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          NavBarItem(
            'Home',
            HomeRoute,
            icon: Icons.videocam,
          ),
          NavBarItem('Timeline', TimelineRoute, icon: Icons.videocam),
          NavBarItem(
            'Portfolio',
            PortfolioRoute,
            icon: Icons.videocam,
          ),
          NavBarItem(
            'Contact',
            ContactRoute,
            icon: Icons.help,
          ),
        ],
      ),
    );
  }
}
