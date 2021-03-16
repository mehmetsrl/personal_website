import 'package:flutter/material.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/widgets/info/personal_detail_widget.dart';
import 'package:personal_website/widgets/web_buton/web_button.dart';
import 'package:provider/provider.dart';
class HomeContentMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PersonalDetailWidget(Provider.of<LayoutViewmodel>(context,listen: false).personalInfo),
        SizedBox(
          height: 100,
        ),
        WebButton('Support me!'),
      ],
    );
  }
}
