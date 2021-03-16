
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/widgets/info/personal_contact_widget.dart';
import 'package:provider/provider.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,),
        PersonalContactWidget(Provider.of<LayoutViewmodel>(context,listen: false).personalInfo),
      ],
    );
  }
}