import 'dart:typed_data';

import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class AuthenticationService with ReactiveServiceMixin {
  AuthenticationService() {
    listenToReactiveValues([_loggedIn]);
  }

  ArweaveService _arweaveService = locator<ArweaveService>();

  RxValue<bool> _loggedIn = RxValue<bool>(initial: false);
  bool get loggedIn => _loggedIn.value;

  /// Login using the [key], which identifies the wallet.
  bool login({@required Uint8List key}) {
    try {
      _arweaveService.initializeWallet(
        _arweaveService.decodeWalletKey(key: key),
      );

      _loggedIn.value = true;
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  void logOut() {
    _loggedIn.value = false;
  }
}
