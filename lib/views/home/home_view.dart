import 'package:flutter/material.dart';
import 'package:personal_website/viewmodels/home_viewmodel.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_content_desktop.dart';
import 'home_content_mobile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      builder: (context, model, widget) => model.busy
          ? Center(child: CircularProgressIndicator())
          : ScreenTypeLayout(
              mobile: HomeContentMobile(),
              desktop: HomeContentDesktop(),
            ), viewModelBuilder: () { return HomeViewModel(); },
    );
  }
}
