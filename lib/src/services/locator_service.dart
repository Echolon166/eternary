import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/src/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// Locator is to access objects e.g. from UI.
GetIt locator = GetIt.instance;

/// Register to the objects so they can be called by the locator.
/// Must be called directly in the start-up code.
void setupLocator() {
  locator.registerLazySingleton(
    () => NavigationService(),
  );
  locator.registerLazySingleton(
    () => ArweaveService(),
  );
}

void locatorNavigateTo(String navigationRoute) {
  locator<NavigationService>().navigateTo(navigationRoute);
}

void locatorGoBack() {
  locator<NavigationService>().goBack();
}

GlobalKey<NavigatorState> locatorGetNavigatorKey() {
  return locator<NavigationService>().getNavigatorKey();
}
