import 'package:eternary/src/services/locator_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eternary/src/app.dart';

void main() {
  setupLicenses();

  /// Register to the locator objects
  setupLocator();

  runApp(MyApp());
}

/// Adds missing licenses, so they can be displayed together in LicensePage
void setupLicenses() {
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/fonts/Overpass/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/fonts/PalanquinDark/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
