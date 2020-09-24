import 'package:eternary/src/services/authentication_service.dart';
import 'package:eternary/src/services/navigation_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LayoutTemplateViewModel extends ReactiveViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authenticationService];

  bool get loggedIn => _authenticationService.loggedIn;

  GlobalKey<NavigatorState> get navigatorKey => _navigationService.navigatorKey;

  void logOut() => _authenticationService.logOut();

  Future navigateToNamedRoute({@required String routeName}) async {
    await _navigationService.navigateToNamedRoute(
      routeName: routeName,
    );
  }
}
