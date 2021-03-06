import 'package:eternary/src/ui/views/landing/landing_view.dart';
import 'package:eternary/src/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;

/// Generates routes for the views.
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    /// Route for the Landing view
    case Constants.LandingRoute:
      return _getPageRoute(LandingView(), settings);

    /// Route for the Home view
    case Constants.HomeRoute:
      return _getPageRoute(HomeView(), settings);

    /// Unknown Route will be redirected to Landing view
    default:
      return _getPageRoute(LandingView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

/// Replaces native material page route animation with fading animation.
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
