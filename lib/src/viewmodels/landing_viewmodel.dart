import 'dart:typed_data';

import 'package:eternary/src/services/authentication_service.dart';
import 'package:eternary/src/services/navigation_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class LandingViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void login({@required Uint8List key}) {
    _authenticationService.login(key: key);
  }

  Future navigateToNamedRoute({@required String routeName}) async {
    await _navigationService.navigateToNamedRoute(
      routeName: routeName,
    );
  }
}
