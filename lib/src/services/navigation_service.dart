import 'package:flutter/material.dart';

/// NavigationService is to handle navigation.
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> getNavigatorKey() {
    return navigatorKey;
  }

  /// Navigate to named route: [routeName].
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  /// Navigate to previous route.
  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
