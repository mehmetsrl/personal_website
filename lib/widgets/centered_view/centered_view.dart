import 'package:flutter/material.dart';
import 'package:personal_website/viewmodels/layoutViewModel.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context,sizing) =>
      Container(
        padding: sizing.isDesktop? const EdgeInsets.only(right: 70, left: 70, top: 20):const EdgeInsets.only(right: 50, left: 50, top: 10),
        // padding: const EdgeInsets.only(right: 70, left: 70, top: 20),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}
