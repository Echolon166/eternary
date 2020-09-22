import 'dart:typed_data';

import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/src/services/navigation_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:eternary/utils/constants.dart' as Constants;

class LandingViewModel extends BaseViewModel {
  final ArweaveService _arweaveService = locator<ArweaveService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void login(Uint8List key) {
    if (_arweaveService.login(key)) {
      navigateToRoute(Constants.HomeRoute);
    }
  }

  Future navigateToRoute(String route) async {
    await _navigationService.navigateTo(route);
  }
}
