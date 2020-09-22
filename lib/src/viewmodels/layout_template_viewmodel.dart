import 'package:eternary/src/services/navigation_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LayoutTemplateViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  GlobalKey<NavigatorState> get navigatorKey => _navigationService.navigatorKey;

  Future navigateToRoute(String route) async {
    await _navigationService.navigateTo(route);
  }
}
