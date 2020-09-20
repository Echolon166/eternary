import 'package:eternary/src/ui/views/home/home_view.dart';
import 'package:eternary/src/ui/views/timeline/timeline_view.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Constants.HomeRoute:
      return _getPageRoute(HomeView(), settings);
    case Constants.TimelineRoute:
      return _getPageRoute(TimelineView(), settings);
    default:
    //  TODO: Add error route
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
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

  final Widget child;
  final String routeName;
}
