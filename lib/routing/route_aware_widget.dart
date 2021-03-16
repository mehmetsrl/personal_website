import 'dart:collection';

import 'package:flutter/material.dart';

import '../main.dart';

class PageArguments {
  final String title;
  final int pageLevel;
  final String id;
  String message;
  PageArguments(
      {@required this.title,
      @required this.pageLevel,
      this.id,
      this.message: ''});
}

class PageInfo {
  final String name;
  final PageArguments arguments;
  PageInfo({@required this.name, @required this.arguments});
}

class RouteAwareWidget extends StatefulWidget {
  static String get routePath => _routePath;
  static String _routePath;
  static StringBuffer _routePathBuffer = StringBuffer();
  static final Queue<PageInfo> routePathQueue = Queue<PageInfo>();
  static String rootName = '';

  PageArguments pageArgs;
  final RouteSettings settings;
  final bool isRoot;
  final Widget child;
  final Function(String) onRouteChangedTo, onRouteChangedFrom;
  // static String CurrentState
  // static String _currentState;

  RouteAwareWidget(this.settings,
      {@required this.child,
      this.onRouteChangedTo,
      this.onRouteChangedFrom,
      this.isRoot: false}) {
    pageArgs = settings.arguments as PageArguments;
    if (this.isRoot) {
      rootName = this.settings.name;
    }
  }

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

//2
  @override
  // Called when the current route has been pushed.
  void didPush() {
    while (RouteAwareWidget.routePathQueue.length > 0 &&
        RouteAwareWidget.routePathQueue.last.arguments.pageLevel >=
            widget.pageArgs.pageLevel) {
      RouteAwareWidget.routePathQueue.removeLast();
    }
    RouteAwareWidget.routePathQueue
        .add(PageInfo(name: widget.settings.name, arguments: widget.pageArgs));

    _updateRoutePath();
    widget.onRouteChangedTo(widget.settings.name);
  }

//1
  @override
  void didPushNext() {
    _updateRoutePath();
    widget.onRouteChangedFrom(widget.settings.name);
  }

//2
  @override
  // Called when the current route has been poped.
  void didPop() {
    // if(RouteAwareWidget.routePathQueue.last.name!=RouteAwareWidget.rootName)
    //   RouteAwareWidget.routePathQueue.removeLast();

    _updateRoutePath();
    widget.onRouteChangedTo(RouteAwareWidget.routePathQueue.last.name);
  }

//1
  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    _updateRoutePath();
    widget.onRouteChangedFrom(RouteAwareWidget.routePathQueue.last.name);
  }

  void _updateRoutePath() {
    RouteAwareWidget._routePathBuffer.clear();

    RouteAwareWidget.routePathQueue.forEach((routePathElement) {
      RouteAwareWidget._routePathBuffer.write(routePathElement.arguments.title +
          (routePathElement.arguments.id != null
              ? routePathElement.arguments.id
              : ''));
      if (RouteAwareWidget.routePathQueue.last != routePathElement)
        RouteAwareWidget._routePathBuffer.write(' ');
    });
    RouteAwareWidget._routePath = RouteAwareWidget._routePathBuffer.toString();

    print("_routePath: " + RouteAwareWidget._routePath);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
