import 'package:flutter/material.dart';
import 'package:personal_website/constants/text_styles.dart';
import 'package:personal_website/models/personalInfo.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/_provider_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PersonalDetailWidget extends StatelessWidget {
  final PersonalInfo personalInfo;
  const PersonalDetailWidget(this.personalInfo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
        value: personalInfo,
        child: ScreenTypeLayout(
          desktop: _DesktopWidget(),
          mobile: _MobileWidget(),
        ));
  }
}

// ignore: unused_element
class _DesktopWidget extends ProviderWidget<LayoutViewmodel> {
  @override
  Widget build(BuildContext context, LayoutViewmodel layoutModel) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Text(
        //   layoutModel.personalInfo.name,
        //   style: getTextStyle(TextTypes.title,
        //       deviceScreenType: DeviceScreenType.desktop),
        // ),
        // SizedBox(
        //   width: 50,
        // ),
        Expanded(
          child: Text(
            layoutModel.personalInfo.description,
            style: getTextStyle(TextTypes.text,
                deviceScreenType: DeviceScreenType.desktop),
          ),
        )
      ],
    );
  }
}

// ignore: unused_element
class _MobileWidget extends ProviderWidget<LayoutViewmodel> {
  @override
  Widget build(BuildContext context, LayoutViewmodel layoutModel) {
    return Column(
      children: <Widget>[
        // Text(
        //   layoutModel.personalInfo.name,
        //   style: getTextStyle(TextTypes.title,
        //       deviceScreenType: DeviceScreenType.mobile),
        // ),
        // SizedBox(
        //   height: 50,
        // ),
        Text(
          layoutModel.personalInfo.description,
          style: getTextStyle(TextTypes.text,
              deviceScreenType: DeviceScreenType.mobile),
        ),
      ],
    );
    ;
  }
}
