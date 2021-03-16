import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class BusyContent extends StatefulWidget {
  final bool busy;
  final Widget child;
  const BusyContent({@required this.child, this.busy = false});

  @override
  _BusyContentState createState() => _BusyContentState();
}

class _BusyContentState extends State<BusyContent> {
  @override
  Widget build(BuildContext context) {
    return widget.busy
        ? Center(
            child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          )
        : widget.child;
  }
}
