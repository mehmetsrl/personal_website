import 'package:flutter/material.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:personal_website/widgets/centered_view/centered_view.dart';
import 'package:personal_website/widgets/navigation_bar/navigation_bar.dart';
import 'package:personal_website/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatefulWidget {
  final Widget child;
  const LayoutTemplate({Key key, @required this.child}) : super(key: key);

  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return ResponsiveBuilder(
      builder: (context, sizingInformation) =>
          ViewModelProvider<LayoutViewmodel>.withConsumer(
        onModelReady: (model) {
          model.getInitialData();
        },
        builder: (context, model, widget) {
          model.updateScaffoldKey(_scaffoldKey);
          model.updateSizingInfo(sizingInformation);
          return model.busy
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  key: _scaffoldKey,
                  drawer:
                      model.isMobileOrTablet ? NavigationDrawer() : Container(),
                  backgroundColor: Colors.white,
                  body: CenteredView(
                    child: Column(
                      children: <Widget>[
                        NavigationBar(_scaffoldKey),
                        Expanded(
                          child: Padding(
                            padding: model.isDesktop
                                ? EdgeInsets.only(right: 50, left: 50, top: 20)
                                : EdgeInsets.only(right: 20, left: 20, top: 10),
                            child: this.widget.child,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
        viewModelBuilder: () {
          return LayoutViewmodel(
              scaffoldKey: _scaffoldKey, sizingInformation: sizingInformation);
        },
      ),
    );
  }
}
