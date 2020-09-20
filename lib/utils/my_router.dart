import 'package:eternary/src/ui/screens/home/home_screen.dart';
import 'package:eternary/src/ui/screens/timeline/timeline_screen.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Constants.HomeRoute:
      return _getPageRoute(HomeScreen());
    case Constants.TimelineRoute:
      return _getPageRoute(TimelineScreen());
    default:
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(child: child);
}

class _FadeRoute extends PageRouteBuilder {
  _FadeRoute({this.child})
      : super(
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
}
