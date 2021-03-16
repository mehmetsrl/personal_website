import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_website/models/routing_model.dart';
import 'package:personal_website/routing/route_names.dart';
import 'package:personal_website/views/contact/contact_view.dart';
import 'package:personal_website/views/home/home_view.dart';
import 'package:personal_website/views/portfolio/portfolio_view.dart';
import 'package:personal_website/views/portfolio/product_view.dart';
import 'package:personal_website/views/timeline/timeline_event_view.dart';
import 'package:personal_website/views/timeline/timeline_view.dart';
import 'route_aware_widget.dart';

import 'package:personal_website/extensions/string_extensions.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  RoutingModel routingData = settings.name.getRoutingData;

  switch (routingData.route) {
    case HomeRoute:
      return _getPageRoute(
          HomeView(),
          RouteSettings(
              name: settings.name,
              arguments: PageArguments(title: 'Home', pageLevel: 10)));
    case ContactRoute:
      return _getPageRoute(
          ContactView(),
          RouteSettings(
              name: settings.name,
              arguments: PageArguments(title: 'Contact', pageLevel: 20)));
    case PortfolioRoute:
      return _getPageRoute(
          PortfolioView(keywordList: routingData['keywords']),
          // PortfolioView(),
          RouteSettings(
              name: settings.name,
              arguments: PageArguments(title: 'Portfolio', pageLevel: 20,id:routingData['keywords']?.toString())));
    case ProductRoute:
      // var id = int.tryParse(routingData['id']);
      return _getPageRoute(
          ProductView(
            id: routingData['id'].first,
          ),
          RouteSettings(
              name: settings.name,
              arguments: PageArguments(
                  title: 'Product', pageLevel: 30, id: routingData['id'].first)));

    case TimelineRoute:
      return _getPageRoute(
          TimelineView(),
          RouteSettings(
              name: settings.name,
              arguments: PageArguments(title: 'Timeline', pageLevel: 20)));
    case EventRoute:
      // var id = int.tryParse(routingData['id']);
      return _getPageRoute(
          EventView(
            id: routingData['id'].first,
          ),
          RouteSettings(
              name: settings.name,
              arguments: PageArguments(
                  title: 'Event', pageLevel: 30, id: routingData['id'].first)));

    default:
      return _getPageRoute(
          HomeView(),
          RouteSettings(
              name: HomeRoute,
              arguments: PageArguments(title: 'Home', pageLevel: 10)));
  }
}

PageRoute _getPageRoute(Widget viewToShow, RouteSettings settings) {
  viewToShow = RouteAwareWidget(
    settings,
    child: viewToShow,
    onRouteChangedTo: (String routeName) => {
      // print("onRouteChangedTo:" +
      //     routeName +
      //     " fullPath:" +
      //     RouteAwareWidget.routePath)
    },
    onRouteChangedFrom: (String routeName) => {
      // print("onRouteChangedFrom:" +
      //     routeName +
      //     " fullPath:" +
      //     RouteAwareWidget.routePath)
    },
    isRoot: (settings.name == HomeRoute),
  );

  return _FadeRoute(child: viewToShow, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
