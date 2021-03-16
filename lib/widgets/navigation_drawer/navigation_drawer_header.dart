import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:personal_website/constants/app_colors.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  Future<bool> launchMailto(String emailAddress) async {
    final mailtoLink = Mailto(
      to: [emailAddress],
    );
    return await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    String emailAddress =
        Provider.of<LayoutViewmodel>(context,listen: false).personalInfo.email;

    return Container(
      height: 150,
      color: primaryColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            Provider.of<LayoutViewmodel>(context,listen: false).personalInfo.name +
                ' ' +
                Provider.of<LayoutViewmodel>(context,listen: false).personalInfo.surname,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          InkWell(
            child: Text(
              emailAddress,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () => {launchMailto(emailAddress)},
          )
        ],
      ),
    );
  }
}
