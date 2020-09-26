import 'dart:typed_data';

import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class AuthenticationService with ReactiveServiceMixin {
  AuthenticationService() {
    listenToReactiveValues([_loggedIn]);
  }

  ArweaveService _arweaveService = locator<ArweaveService>();

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  /// Login using the [key], which identifies the wallet.
  bool login({@required Uint8List key}) {
    try {
      _arweaveService.initializeWallet(
        _arweaveService.decodeWalletKey(key: key),
      );

      _loggedIn = true;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  void logOut() {
    _loggedIn = false;
    notifyListeners();
  }
}
