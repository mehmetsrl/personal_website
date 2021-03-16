import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  // void pop(/*BuildContext context, dynamic data*/) {
  //   return _navigationKey.currentState.pop(/*context*/);
  // }

  pop() {
    _navigationKey.currentState.pop();
  }

  Future<dynamic> navigateTo(String routeName, {Map<String, dynamic> query}) {
    if (query != null) {
      routeName=Uri(path: routeName,queryParameters: query).toString();
    }
    print("navigating to: "+routeName);
    return _navigationKey.currentState
        .pushNamed(routeName);
  }

  // Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
  //   return _navigationKey.currentState
  //       .pushNamed(routeName, arguments: arguments);
  // }
}
