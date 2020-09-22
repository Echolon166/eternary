import 'package:flutter/material.dart';

/// NavigationService is to handle navigation.
class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// Navigate to named route: [routeName].
  Future<dynamic> navigateTo(String routeName) {
    return _navigatorKey.currentState.pushNamed(routeName);
  }

  /// Navigate to previous route.
  void goBack() {
    return _navigatorKey.currentState.pop();
  }
}
